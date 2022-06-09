port = (ARGV[0] || 3325).to_i

require 'rumbster'
require 'mail'

class TheServer
  def initialize
    @bad_words_regexp = Regexp.union(File.readlines("bad_words_list.txt", chomp: true))
    @white_regexp = Regexp.new("@(cpnv.ch|vd.ch)$")
    
    @stats_filename = "data/stats.txt"
    @store_location = "data"
    
    @received_count = 0
    @rejected_count = 0
  end
  
  def update(string_message)
    mail = Mail.read_from_string(string_message)

    puts "Received mail: #{mail.from} #{mail.to}"
    @received_count += 1
    
    if has_bad_words?(mail) || has_invalid_recipient?(mail)
      puts "Rejected mail: #{mail.from} #{mail.to}"
      @rejected_count += 1
    else
      puts "Stored mail  : #{mail.from} #{mail.to}"

      mail.to.each do |recipient|
        target_dir = File.join(@store_location, recipient)
        Dir.mkdir(target_dir) unless Dir.exist?(target_dir)
        File.write(File.join(target_dir, "#{Time.now.to_f}.eml"), mail.raw_source)
      end
    end
    
    File.open(@stats_filename, "w") do |file|
      file.puts "Received count: #{@received_count}"
      file.puts "Rejected count: #{@rejected_count}"
      file.puts "Spam ratio: #{@rejected_count * 100 / @received_count}%"
    end

  rescue
    # Catch any exceptions, show them, and keep alive to be able to handle upcoming mails
    STDERR.puts $!.message
    STDERR.puts $!.backtrace
  end
  
  def has_bad_words?(mail)
    mail.body.match(@bad_words_regexp)
  end

  def has_invalid_recipient?(mail)
    mail.destinations.none? {|destination| @white_regexp.match(destination) }
  end
end

rumbster = Rumbster.new(port)
rumbster.add_observer(TheServer.new)
rumbster.start
rumbster.join
