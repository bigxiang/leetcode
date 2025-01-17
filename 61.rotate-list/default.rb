#
# @lc app=leetcode.cn id=61 lang=ruby
# @lcpr version=30204
#
# [61] 旋转链表
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
# @param {Integer} k
# @return {ListNode}
def rotate_right(head, k)
  return if head.nil?

  count, tail = find_count_and_tail(head)
  k %= count
  return head if k == 0

  dummy = ListNode.new
  dummy.next = head
  curr = dummy
  (count - k).times do
    curr = curr.next
  end
  new_head = curr.next
  curr.next = nil
  tail.next = head
  new_head
end

def find_count_and_tail(head)
  count = 0
  tail = nil
  while head
    tail = head
    head = head.next
    count += 1
  end
  [count, tail]
end
# @lc code=end

#
# @lcpr case=start
# [1,2,3,4,5]\n2\n
# @lcpr case=end

# @lcpr case=start
# [0,1,2]\n4\n
# @lcpr case=end

# @lcpr case=start
# []\n4\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4]\n4\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4,5,6,7,8,9,10]\n213\n
# @lcpr case=end

#
