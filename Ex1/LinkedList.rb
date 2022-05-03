require_relative 'Node'

class LinkedList
    attr_accessor :head, :tail, :size

    def initialize()
        @head = nil
        @tail = nil
        @size = 0
    end

    def addTail(value)
      node = Node.new(value)
      if @size==0
          @head = node
          @tail = node
      else 
          @tail.next = node
          node.prev = @tail
          @tail = node
      end
      @size += 1
      return self
   end

   
   def addHead(value)
    node = Node.new(value)
    if @size==0 
        @head = node
        @tail = node
    else 
        @head.prev = node
        node.next = @head
        @head = node
    end
    @size += 1
    return self
   end

    def getTail()
     return @tail.value
    end

    def getHead()
      return @head.value
    end
   
    def removeTail()
        if @size == 1
            @head = nil
            @tail = nil
        else
            @tail = @tail.prev
            @tail.next = nil
        end
        @size -= 1
    end

    def removeHead()
        if @size == 1
            @head = nil
            @tail = nil
        else
            @head = @head.next
            @head.prev = nil
        end
        @size -= 1
    end
  
    def getSize()
        return @size
    end

    def isEmpty
        if @head == nil
            return true
        else
            return false
        end
    end

end


