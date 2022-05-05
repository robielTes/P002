require_relative 'Queue'
list = Queue.new

list.enqueue('L')
list.enqueue('O')
list.enqueue('O')
list.enqueue('C')

puts "List size: #{list.size}" # 4
puts "List empty? #{list.isEmpty?}" # false

puts "First element: #{list.dequeue}" # L
puts "Second element: #{list.dequeue}" # O

puts "List size: #{list.size}" # 2
puts "List empty? #{list.isEmpty?}" # false

puts "First element: #{list.dequeue}" # O
puts "Second element: #{list.dequeue}" # C

puts "List size: #{list.size}" # 0
puts "List empty? #{list.isEmpty?}" # true