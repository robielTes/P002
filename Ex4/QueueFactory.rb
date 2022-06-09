# frozen_string_literal: true

require_relative '../Ex2/ArrayQueue'
require_relative '../Ex2/ListQueue'

class QueueFactory
  def self.createQueue(name)
    case name
    when 'optimized_for_memory'
      ArrayQueue.new
    when 'optimized_for_speed'
      ListQueue.new
    end
  end
end
