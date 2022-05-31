class Node
    attr_accessor :value, :next, :prev
    
    def initialize(value)
      @value = value
      @next  = nil
      @prev = nil
    end
  end