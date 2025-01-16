#
# @lc app=leetcode.cn id=234 lang=ruby
# @lcpr version=30204
#
# [234] 回文链表
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
# @return {Boolean}
def is_palindrome(head)
  true if head.nil? || head.next.nil?

  middle = find_middle(head)
  tail = reverse(middle)
  while head && tail
    return false if head.val != tail.val

    head = head.next
    tail = tail.next
  end
  true
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
# [1,2,2,1]\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4,5,4,3,2,1]\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4,4,3,2,1]\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4,4,5,3,2,1]\n
# @lcpr case=end

# @lcpr case=start
# [1,2]\n
# @lcpr case=end

# @lcpr case=start
# [1]\n
# @lcpr case=end

#
