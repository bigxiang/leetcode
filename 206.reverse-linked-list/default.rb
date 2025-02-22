#
# @lc app=leetcode id=206 lang=ruby
#
# [206] Reverse Linked List
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
def reverse_list(head)
  prev = nil
  curr = head
  while curr
    nxt = curr.next
    curr.next = prev
    prev = curr
    curr = nxt
  end

  prev
end
# @lc code=end

# @lcpr case=start
# [1,2]\n
# @lcpr case=end

# @lcpr case=start
# []\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4,5]\n
# @lcpr case=end
