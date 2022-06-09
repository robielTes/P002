require 'rumbster'

class ServerFactory
  def self.createServer(name,port)
    case name
    when 'rumbster'
      Rumbster.new(port)
    when 'dumster'
      Dumster.new(port)
      end
  end
end
