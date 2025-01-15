#
# @lc app=leetcode.cn id=328 lang=ruby
# @lcpr version=30204
#
# [328] 奇偶链表
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
# @param {ListNode} head
# @return {ListNode}
def odd_even_list(head)
  return head if head.nil? || head.next.nil? || head.next.next.nil?

  odd_head = head
  even_head = head.next
  odd_curr = odd_head
  even_curr = even_head
  while even_curr && even_curr.next
    even_next = even_curr.next
    even_curr.next = even_next.next
    odd_curr.next = even_next

    odd_curr = odd_curr.next
    even_curr = even_curr.next
  end

  odd_curr.next = even_head
  odd_head
end
# @lc code=end

#
# @lcpr case=start
# [1,2,3,4,5]\n
# @lcpr case=end

# @lcpr case=start
# [2,1,3,5,6,4,7]\n
# @lcpr case=end

# @lcpr case=start
# []\n
# @lcpr case=end

# @lcpr case=start
# [1]\n
# @lcpr case=end

# @lcpr case=start
# [1,2]\n
# @lcpr case=end

# @lcpr case=start
# [2,1,3,5,6,4,7,8]\n
# @lcpr case=end

#
