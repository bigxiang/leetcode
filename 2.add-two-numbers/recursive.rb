#
# @lc app=leetcode.cn id=2 lang=ruby
#
# [2] 两数相加
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
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  add_two(l1, l2, 0) 
end

def add_two(l1, l2, digit1)
  return if l1.nil? && l2.nil? && digit1 == 0

  sum = (l1&.val || 0) + (l2&.val || 0) + digit1

  digit0 = sum % 10
  digit1 = sum / 10

  result = ListNode.new(digit0)
  result.next = add_two(l1&.next, l2&.next, digit1)
  result
end
# @lc code=end

