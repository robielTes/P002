require_relative 'QueueFactory'

queue1 = QueueFactory.createQueue('optimized_for_memory')
queue2 = QueueFactory.createQueue('optimized_for_speed')

queue1.enqueue(42)
queue2.enqueue(1337)


puts "queue1 size: #{queue1.size}" # 1
puts "queue2 size: #{queue2.size}" # 1