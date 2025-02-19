#
# @lc app=leetcode id=24 lang=ruby
#
# [24] Swap Nodes in Pairs
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
def swap_pairs(head)
  dummy = ListNode.new
  dummy.next = head
  slow = dummy
  fast = dummy
  prev = dummy
  while fast.next && fast.next.next
    slow = slow.next
    fast = fast.next.next

    slow.next = fast.next
    fast.next = slow
    prev.next = fast
    prev = slow
    fast = slow
  end
  dummy.next
end
# @lc code=end

# @lcpr case=start
# [1,2,3,4]\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4,5]\n
# @lcpr case=end

# @lcpr case=start
# [1]\n
# @lcpr case=end

# @lcpr case=start
# [1,2]\n
# @lcpr case=end

# @lcpr case=start
# []\n
# @lcpr case=end
