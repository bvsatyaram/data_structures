class LinkedListNode
  attr_accessor :value, :next

  def initialize(val)
    self.value = val
  end
end

class LinkedList
  def initialize
    @sentinel = LinkedListNode.new(nil)
  end

  def head
    @sentinel.next
  end

  def insert(val)
    node = LinkedListNode.new(val)
    node.next = @sentinel.next
    @sentinel.next = node
  end

  def delete
    @sentinel.next = @sentinel.next.try(:next)
  end
end

# ll = LinkedList.new
# ll.insert(1)
# ll.insert(2)
# ll.insert(2)
# puts ll.inspect
