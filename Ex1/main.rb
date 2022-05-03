require_relative 'LinkedList'
list = LinkedList.new

puts list.getSize() # 0
puts list.isEmpty() # true

list.addHead('L')
list.addHead('O')
list.addHead('O')
list.addHead('C')

puts list.getSize() # 4
puts list.isEmpty() # false
puts list.getHead() # C
puts list.getTail() # L

list.addTail('X')
list.addTail('Y')

puts list.getSize() # 6
puts list.isEmpty() # false
puts list.getHead() # C
puts list.getTail() # Y

list.removeHead()
list.removeTail()

puts list.getSize() # 4
puts list.isEmpty() # false
puts list.getHead() # O
puts list.getTail() # X