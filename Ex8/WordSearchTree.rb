require_relative 'Node'

class WordSearchTree
  BASE = 'a'.ord

  def initialize()
    @root = Node.new
  end

  def root
    @root
  end

  def fill(elements)
    elements.each do |element|
      add_element(element)
    end
    return true
  end

  def add_element(element)
    currentNode = self.root
    element.chars.each do |char|
      if currentNode.child(char.ord - BASE).nil?
        currentNode.add_child(char.ord - BASE)
      end

      currentNode = currentNode.child(char.ord - BASE)
      if char.eql?(element.chars.last)
        currentNode.end_of_element = true
      end
    end
  end

  def exists?(searched)
    currentNode = self.root

    found = false
    searched.each_char do |char|
      if currentNode.child(char.ord - BASE).nil?
        break
      else
        currentNode = currentNode.child(char.ord - BASE)
        if currentNode.end_of_element? && char.eql?(searched.chars.last)
          found = true
        end
      end
    end

    return found
  end

  

end
