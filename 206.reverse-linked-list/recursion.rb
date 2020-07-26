#
# @lc app=leetcode id=206 lang=ruby
#
# [206] Reverse Linked List
#

# @lc code=start
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  return head if head.nil? || head.next.nil?

  root = reverse_list(head.next)
  head.next.next = head
  head.next = nil
  root
end
# @lc code=end

# class ListNode
#   attr_accessor :val, :next
#   def initialize(val = 0, _next = nil)
#     @val = val
#     @next = _next
#   end
# end

# head = ListNode.new(1)
# n2 = ListNode.new(2)
# n3 = ListNode.new(3)
# n4 = ListNode.new(4)
# n5 = ListNode.new(5)
# head.next = n2
# n2.next = n3
# n3.next = n4
# n4.next = n5

# r =  reverse_list(head)
# while r
#   puts r.val
#   r = r.next
# end
