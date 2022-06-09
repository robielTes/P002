require 'rumbster'

class ServerFactory
  def self.createFactory(name,port)
    case name
    when 'rumbster'
      Rumbster.new(port)
    when 'dumster'
      Dumster.new(port)
      end
  end
end
