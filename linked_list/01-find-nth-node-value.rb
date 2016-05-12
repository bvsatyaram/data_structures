# current_node = Get the head
# n-1 times
#   current_node = current_node.next
# current_node.val

require_relative '00-implement'

ll = LinkedList.new
(1..100).each do |i|
  ll.insert(i)
end

n = 55
current_node = ll.head
(n-1).times do
  current_node = current_node.next
end
puts current_node.value
