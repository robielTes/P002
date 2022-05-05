require_relative 'LinkedList'
list = LinkedList.new

puts "List size: #{list.size}" # 0
puts "List empty? #{list.isEmpty?}" # true

list.addHead('L')
list.addHead('O')
list.addHead('O')
list.addHead('C')

puts "List size: #{list.size}" # 4
puts "List empty? #{list.isEmpty?}" # false
puts "First element: #{list.getHead()}" # C
puts "Last element:  #{list.getTail()}" # L

list.addTail('X')
list.addTail('Y')

puts "List size: #{list.size}" # 6
puts "List empty? #{list.isEmpty?}" # false
puts "First element: #{list.getHead()}" # C
puts "Last element:  #{list.getTail()}" # Y

puts "RemoveHead: #{list.removeHead()}"
puts "RemoveHead: #{list.removeTail()}"

puts "List size: #{list.size}" # 4
puts "List empty? #{list.isEmpty?}" # false
puts "First element: #{list.getHead()}" # O
puts "Last element:  #{list.getTail()}" # X

puts "You should see an empty list exception now"
begin
  puts "RemoveHead: #{list.removeHead}"
  puts "RemoveHead: #{list.removeHead}"
  puts "RemoveHead: #{list.removeHead}"
  puts "RemoveHead: #{list.removeHead}"
  puts "RemoveHead: #{list.removeHead}"
rescue EmptyListError
  puts "!!! The list is empty !!!"
end