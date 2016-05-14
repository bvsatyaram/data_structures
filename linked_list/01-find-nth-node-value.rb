# Write a function that takes 2 arguments; a linked list (ll) and on integer(n).
# The function should return the value of the nth node in the linked list.
#
# Assume that the linked is in non-empty and is of length at least 'n'

require_relative 'linked_list'

def value_of_nth_node(ll, n)
  current_node = ll.head
  (n-1).times do
    current_node = current_node.next
  end
  return current_node.value
end


require "minitest/autorun"

class TestValueOfNthNode < Minitest::Test
  def setup
    @long_linked_list = LinkedList.new
    (1..100).each do |i|
      @long_linked_list.insert(i)
    end
    @short_linked_list = LinkedList.new
    @short_linked_list.insert(1)
  end

  def test_first_node_of_long_linked_list
    assert_equal 100, value_of_nth_node(@long_linked_list, 1)
  end

  def test_last_node_of_long_linked_list
    assert_equal 1, value_of_nth_node(@long_linked_list, 100)
  end

  def test_middle_node_of_long_linked_list
    assert_equal 46, value_of_nth_node(@long_linked_list, 55)
  end

  def test_first_node_of_short_linked_list
    assert_equal 1, value_of_nth_node(@short_linked_list, 1)
  end
end
