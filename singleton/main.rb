require_relative 'ArrayQueue'
require_relative 'ListQueue'

queue1 = ArrayQueue.instance
queue2 = ListQueue.instance

queue1.enqueue(42)
queue2.enqueue(1337)


puts "queue1 size: #{queue1.size}" # 1
puts "queue2 size: #{queue2.size}" # 1