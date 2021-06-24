#
# @lc app=leetcode.cn id=2 lang=python3
#
# [2] 两数相加
#

# @lc code=start
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: ListNode, l2: ListNode) -> ListNode:
        head = tail = ListNode()
        carry = 0
        while l1 is not None or l2 is not None or carry == 1:
            num1 = num2 = 0
            if l1 is not None:
                num1 = l1.val
                l1 = l1.next

            if l2 is not None:
                num2 = l2.val
                l2 = l2.next

            sum = num1 + num2 + carry
            val = sum % 10
            carry = sum // 10

            tail.next = ListNode(val)
            tail = tail.next

        return head.next
# @lc code=end

