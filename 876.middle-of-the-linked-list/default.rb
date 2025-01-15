#
# @lc app=leetcode.cn id=876 lang=ruby
# @lcpr version=30204
#
# [876] 链表的中间结点
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
def middle_node(head)
  dummy = ListNode.new
  dummy.next = head
  fast = dummy
  slow = head
  while fast.next && fast.next.next
    slow = slow.next
    fast = fast.next.next
  end
  slow
end
# @lc code=end

#
# @lcpr case=start
# [1,2,3,4,5]\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4,5,6]\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4,5,6,7,8,9,10]\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4,5,6,7,8,9,10,11]\n
# @lcpr case=end

# @lcpr case=start
# [1,2]\n
# @lcpr case=end

# @lcpr case=start
# [1]\n
# @lcpr case=end

#
