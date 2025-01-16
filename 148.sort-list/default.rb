#
# @lc app=leetcode.cn id=148 lang=ruby
# @lcpr version=30204
#
# [148] 排序链表
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
def sort_list(head)
  return if head.nil?
  return head if head.next.nil?

  middle = find_middle(head)
  # puts "head: #{head.val}, middle: #{middle.val}"

  merge_list(sort_list(head), sort_list(middle))
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

def merge_list(head1, head2)
  dummy = ListNode.new
  curr = dummy
  # puts "head1: #{head1.val}, head2: #{head2.val}"

  while head1 || head2
    if head1.nil?
      curr.next = head2
      head2 = head2.next
      curr = curr.next
      next
    end

    if head2.nil?
      curr.next = head1
      head1 = head1.next
      curr = curr.next
      next
    end

    if head1.val <= head2.val
      curr.next = head1
      head1 = head1.next
    else
      curr.next = head2
      head2 = head2.next
    end
    curr = curr.next
  end

  dummy.next
end
# @lc code=end

#
# @lcpr case=start
# [4,2,1,3]\n
# @lcpr case=end

# @lcpr case=start
# [-1,5,3,4,0]\n
# @lcpr case=end

# @lcpr case=start
# []\n
# @lcpr case=end

#
