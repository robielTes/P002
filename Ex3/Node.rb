class Node
  attr_accessor :letter, :children, :word_finished
  
  def initialize()
    @children = Array.new(26)
    @word_finished = false
  end
  
  def add_child(child_node)
    @children << child_node
  end
  
  def get_child(char)
    @children.each do |child|
      return child if child.letter == char
    end
    nil
  end
  
  def mark_as_word_finished
    @word_finished = true
  end
  
  def word_finished?
    @word_finished
  end
  
  
end