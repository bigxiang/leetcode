#
# @lc app=leetcode.cn id=19 lang=ruby
# @lcpr version=30204
#
# [19] 删除链表的倒数第 N 个结点
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
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  dummy = ListNode.new
  dummy.next = head

  dfs(head, dummy, n)

  dummy.next
end

def dfs(curr, prev, n)
  return 0 unless curr

  count = dfs(curr.next, curr, n) + 1
  prev.next = curr.next if count == n
  count
end
# @lc code=end

#
# @lcpr case=start
# [1,2,3,4,5]\n2\n
# @lcpr case=end

# @lcpr case=start
# [1]\n1\n
# @lcpr case=end

# @lcpr case=start
# [1,2]\n1\n
# @lcpr case=end

#
