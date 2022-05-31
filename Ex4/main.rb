require_relative 'ArrayQueue'
require_relative 'ListQueue'

def createQueue(list)
 if list == "ArrayQueue"
  return ArrayQueue.new
 elsif list == "ListQueue"
  return ListQueue.new
 end
end

queue1 = createQueue('ArrayQueue')
queue2 = createQueue('ListQueue')

queue1.enqueue(42)
queue2.enqueue(1337)


puts "queue1 size: #{queue1.size}" # 1
puts "queue2 size: #{queue2.size}" # 1