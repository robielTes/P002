require_relative 'LinkedList'

class ListQueue

    private_class_method :new
    def self.instance
        if @instance.nil?
            @instance = new
        end
        return @instance
    end

    def initialize
        @queue = LinkedList.new
    end
    
    def enqueue(el)
        @queue.addTail(el)
    end
    
    def dequeue
        @queue.removeHead
    end

    def size
        @queue.size
    end

    def isEmpty?
        @queue.isEmpty?
    end

end