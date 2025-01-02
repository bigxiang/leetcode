/*
 * @lc app=leetcode.cn id=2130 lang=javascript
 * @lcpr version=30204
 *
 * [2130] 链表最大孪生和
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
 * @param {ListNode} head
 * @return {number}
 */
var pairSum = function(head) {
  const dummy = new ListNode(0, head);
  let slow = dummy, fast = dummy;
  while (fast.next && fast.next.next) {
    fast = fast.next.next;
    slow = slow.next;
  }

  let prev = null, curr = slow.next, temp = null;
  slow.next = null;
  while (curr) {
    temp = curr.next;
    curr.next = prev;
    prev = curr;
    curr = temp;
  }

  let sum = 0;
  while (prev) {
    sum = Math.max(sum, prev.val + head.val);
    prev = prev.next;
    head = head.next;
  }

  return sum;
};
// @lc code=end



// @lcpr case=start
// [5,4,2,1]\n
// @lcpr case=end

// @lcpr case=start
// [4,2,2,3]\n
// @lcpr case=end

// @lcpr case=start
// [1,100000]\n
// @lcpr case=end


