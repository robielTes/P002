require_relative 'ArrayQueue'
list = ArrayQueue.new

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

puts "==========================="

require_relative 'ListQueue'
linkedList = ListQueue.new

linkedList.enqueue('L')
linkedList.enqueue('O')
linkedList.enqueue('O')
linkedList.enqueue('C')

puts "List size: #{linkedList.size}" # 4
puts "List empty? #{linkedList.isEmpty?}" # false

puts "First element: #{linkedList.dequeue}" # L
puts "Second element: #{linkedList.dequeue}" # O

puts "List size: #{linkedList.size}" # 2
puts "List empty? #{linkedList.isEmpty?}" # false

puts "First element: #{linkedList.dequeue}" # O
puts "Second element: #{linkedList.dequeue}" # C

puts "List size: #{linkedList.size}" # 0
puts "List empty? #{linkedList.isEmpty?}" # true