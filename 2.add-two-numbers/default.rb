#
# @lc app=leetcode.cn id=2 lang=ruby
# @lcpr version=30204
#
# [2] 两数相加
#

# @lcpr-template-start

# @lcpr-template-end
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
  carry = 0
  head = ListNode.new
  curr = head
  while l1 || l2
    v1 = l1&.val || 0
    v2 = l2&.val || 0
    sum = v1 + v2 + carry
    num = sum % 10
    carry = sum >= 10 ? 1 : 0

    curr.next = ListNode.new(num)

    curr = curr.next
    l1 = l1&.next
    l2 = l2&.next
  end

  curr.next = ListNode.new(1) if carry > 0

  head.next
end
# @lc code=end

#
# @lcpr case=start
# [2,4,3]\n[5,6,4]\n
# @lcpr case=end

# @lcpr case=start
# [0]\n[0]\n
# @lcpr case=end

# @lcpr case=start
# [9,9,9,9,9,9,9]\n[9,9,9,9]\n
# @lcpr case=end

#
