class Node
  def initialize()
      @children = Array.new(26)
      @end_of_element = false
  end

  def children
      @children
  end

  def end_of_element?
      @end_of_element
  end

  def end_of_element=(bool)
      @end_of_element = bool
  end

  def child(position)
      @children[position]
  end

  def add_child(position)
      @children[position] = Node.new
  end

end