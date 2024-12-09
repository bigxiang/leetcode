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
  let node = new ListNode();
  const result = node;
  let carry = 0;
  while (l1 || l2 || carry) {
    let num1 = l1?.val || 0;
    let num2 = l2?.val || 0;
    let sum = num1 + num2 + carry;
    let val = sum % 10;
    carry = sum >= 10 ? 1 : 0;
    l1 = l1?.next;
    l2 = l2?.next;

    node.val = val;
    if (l1 || l2 || carry) node.next = new ListNode();
    node = node.next;
  }

  return result;
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

