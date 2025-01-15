#
# @lc app=leetcode.cn id=21 lang=ruby
# @lcpr version=30204
#
# [21] 合并两个有序链表
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
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
def merge_two_lists(list1, list2)
  root = ListNode.new
  curr = root

  while list1 || list2
    if list1.nil?
      curr.next = list2
      curr = curr.next
      list2 = list2.next
      next
    end

    if list2.nil?
      curr.next = list1
      curr = curr.next
      list1 = list1.next
      next
    end

    if list1.val <= list2.val
      curr.next = list1
      curr = curr.next
      list1 = list1.next
    else
      curr.next = list2
      curr = curr.next
      list2 = list2.next
    end
  end

  root.next
end
# @lc code=end

#
# @lcpr case=start
# [1,2,4]\n[1,3,4]\n
# @lcpr case=end

# @lcpr case=start
# []\n[]\n
# @lcpr case=end

# @lcpr case=start
# []\n[0]\n
# @lcpr case=end

#
