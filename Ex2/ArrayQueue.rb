class ArrayQueue
    def initialize
        @queue = []
    end
    
    def enqueue(el)
        @queue.push(el)
    end
    
    def dequeue
        @queue.shift
    end

    def size
        @queue.size
    end

    def isEmpty?
        @queue.empty?
    end

end