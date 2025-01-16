#
# @lc app=leetcode.cn id=143 lang=ruby
# @lcpr version=30204
#
# [143] 重排链表
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
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
  return head if head.next.nil? || head.next.next.nil?

  middle = find_middle(head)
  tail = reverse(middle)
  dummy = ListNode.new
  curr = dummy

  while tail
    if head.nil?
      curr.next = tail
      curr = curr.next
      tail = tail.next
      next
    end

    curr.next = head
    curr = curr.next
    head = head.next

    curr.next = tail
    curr = curr.next
    tail = tail.next
  end

  dummy.next
end

def find_middle(head)
  dummy = ListNode.new
  dummy.next = head
  slow = head
  prev = dummy
  fast = dummy
  while fast&.next&.next
    prev = slow
    slow = slow.next
    fast = fast.next.next
  end
  prev.next = nil
  slow
end

def reverse(head)
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

#
# @lcpr case=start
# [1,2,3,4]\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4,5]\n
# @lcpr case=end

# @lcpr case=start
# [1,2]\n
# @lcpr case=end

# @lcpr case=start
# [1]\n
# @lcpr case=end

#
