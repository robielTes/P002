require_relative '../Ex2/ArrayQueue'
require_relative '../Ex2/ListQueue'

class QueueFactory
  def self.createQueue(name)
    if name == "optimized_for_memory"
     return ArrayQueue.new
    elsif name == "optimized_for_speed"
     return ListQueue.new
    end
   end
end