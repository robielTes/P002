
class ServerFactory
  def self.createFactory(name)
    case name
    when 'rumbster'
      Rumbster.new
    when 'dumster'
      Dumster.new
      end
  end
end
