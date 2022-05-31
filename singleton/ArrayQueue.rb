class ArrayQueue

    private_class_method :new
    def self.instance
        if @instance.nil?
            @instance = new
        end
        return @instance
    end

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