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
  prev = nil
  curr = head
  while curr
    curr.next, prev, curr = prev, curr, curr.next
  end
  prev
end
# @lc code=end

