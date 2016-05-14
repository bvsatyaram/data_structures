# Given 2 linked lists ll1 and ll2 that intersect, you need to find the value of the node of intersection.
# Write a method that takes 2 linked lists as arguments and return the value of the intersection node

require_relative 'linked_list'

class LinkedList
  def length
    len = 0
    current_node = @sentinel
    while !current_node.next.nil?
      len += 1
      current_node = current_node.next
    end

    return len
  end
end

def find_intersection_value(ll1, ll2)
  length1 = ll1.length
  length2 = ll2.length
  ele1 = ll1.head
  ele2 = ll2.head
  if length1 > length2
    head_start = length1 - length2
    head_start.times do
      ele1 = ele1.next
    end
  else
    head_start = length2 - length1
    head_start.times do
      ele2 = ele2.next
    end
  end

  while ele1 != ele2
    ele1 = ele1.next
    ele2 = ele2.next
  end

  return ele1.try(:value)
end

require "minitest/autorun"

class TestFindIntersectionValue < Minitest::Test
  class LinkedList < LinkedList
    def head=(node)
      @sentinel.next = node
    end

    def push(val)
      node = LinkedListNode.new(val)
      @tail ||= @sentinel
      @tail.next = node
      @tail = node
    end
  end

  def test_length
    ll = LinkedList.new
    ll.push(1)
    ll.push(2)
    ll.push(3)
    ll.push(4)
    ll.push(6)

    assert_equal 5, ll.length
  end

  def test_equal_lengths
    ll1 = LinkedList.new
    ll1.push(1)
    ll1.push(2)
    ll1.push(5)
    ll1.push(6)

    ll2 = LinkedList.new
    ll2.push(3)
    ll2.push(4)
    ll2.head.next.next = ll1.head.next.next

    assert_equal 5, find_intersection_value(ll1, ll2)
  end

  def test_unequal_lengths
    ll1 = LinkedList.new
    ll1.push(0)
    ll1.push(1)
    ll1.push(2)
    ll1.push(5)
    ll1.push(6)

    ll2 = LinkedList.new
    ll2.push(3)
    ll2.push(4)
    ll2.head.next.next = ll1.head.next.next.next

    assert_equal 5, find_intersection_value(ll1, ll2)
  end

  def test_intersection_at_last_node
    ll1 = LinkedList.new
    ll1.push(0)
    ll1.push(1)
    ll1.push(2)
    ll1.push(5)

    ll2 = LinkedList.new
    ll2.push(3)
    ll2.push(4)
    ll2.head.next.next = ll1.head.next.next.next

    assert_equal 5, find_intersection_value(ll1, ll2)
  end

  def test_intersect_at_first_node
    ll1 = LinkedList.new
    ll1.push(1)
    ll1.push(2)
    ll1.push(3)
    ll1.push(4)

    ll2 = LinkedList.new
    ll2.head = ll1.head

    assert_equal 1, find_intersection_value(ll1, ll2)
  end

  def test_same_value_is_not_an_intersection
    ll1 = LinkedList.new
    ll1.push(1)
    ll1.push(2)
    ll1.push(3)
    ll1.push(5)
    ll1.push(6)
    ll1.push(7)

    ll2 = LinkedList.new
    ll2.push(4)
    ll2.push(3)
    ll2.head.next.next = ll1.head.next.next.next

    assert_equal 5, find_intersection_value(ll1, ll2)
  end

  def test_non_intersecting_linked_lists
    ll1 = LinkedList.new
    ll1.push(1)
    ll1.push(2)
    ll1.push(3)

    ll2 = LinkedList.new
    ll2.push(1)
    ll2.push(2)
    ll2.push(3)

    assert_nil find_intersection_value(ll1, ll2)
  end
end
