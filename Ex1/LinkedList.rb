require_relative 'Node'
require_relative 'EmptyListError'

class LinkedList
    attr_accessor :head, :tail, :size

    def initialize()
        @size = 0
    end

    def addTail(value)
      node = Node.new(value)
      if @size==0
          @head = node         
      else 
          @tail.next = node
          node.prev = @tail
      end
      @tail = node
      @size += 1
   end

   
   def addHead(value)
    node = Node.new(value)
    if @size==0 
        @tail = node
    else 
        @head.prev = node
        node.next = @head
    end
    @head = node
    @size += 1
   end

    def getTail()
        raise EmptyListError unless @tail
     return @tail.value
    end

    def getHead()
        raise EmptyListError unless @head
      return @head.value
    end
   
    def removeTail()
        raise EmptyListError unless @tail
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
        raise EmptyListError unless @head
        if @size == 1
            @head = nil
            @tail = nil
        else
            @head = @head.next
            @head.prev = nil
        end
        @size -= 1
    end

    def isEmpty?
        @head == nil
    end

    def each
        cursor = @head
        while cursor
          yield cursor.value
          cursor = cursor.next
        end
      end

end


