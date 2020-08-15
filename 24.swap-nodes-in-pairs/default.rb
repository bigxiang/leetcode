#
# @lc app=leetcode id=24 lang=ruby
#
# [24] Swap Nodes in Pairs
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
def swap_pairs(head)
  return head if head.nil? || head.next.nil?

  new_head = head.next
  head.next = swap_pairs(head.next.next)
  new_head.next = head
  new_head
end
# @lc code=end

