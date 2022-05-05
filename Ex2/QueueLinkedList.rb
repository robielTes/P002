require_relative 'LinkedList'

class QueueLinkedList
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