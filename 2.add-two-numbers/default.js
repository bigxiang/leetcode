/*
 * @lc app=leetcode.cn id=2 lang=javascript
 * @lcpr version=30204
 *
 * [2] 两数相加
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */
var addTwoNumbers = function(l1, l2) {
  const head = new ListNode();
  let curr = head;
  let carry = 0;
  while (l1 || l2 || carry) {
    const num1 = l1?.val || 0;
    const num2 = l2?.val || 0;
    const sum = num1 + num2 + carry;
    carry = sum >= 10 ? 1 : 0;
    val = sum % 10;
    curr.next = new ListNode();
    curr = curr.next;
    curr.val = val;
    l1 = l1?.next;
    l2 = l2?.next;
  }

  return head.next;
};
// @lc code=end



/*
// @lcpr case=start
// [2,4,3]\n[5,6,4]\n
// @lcpr case=end

// @lcpr case=start
// [0]\n[0]\n
// @lcpr case=end

// @lcpr case=start
// [9,9,9,9,9,9,9]\n[9,9,9,9]\n
// @lcpr case=end

 */

