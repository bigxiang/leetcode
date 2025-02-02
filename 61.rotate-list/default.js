/*
 * @lc app=leetcode.cn id=61 lang=javascript
 * @lcpr version=30204
 *
 * [61] 旋转链表
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
 * @param {number} k
 * @return {ListNode}
 */
var rotateRight = function(head, k) {
  if (!head) return head;

  let count = 0;
  let cur = head;
  let tail = null;
  while (cur) {
    count++;
    tail = cur;
    cur = cur.next;
  }

  k = k % count;
  if (k === 0) return head;

  let i = 1;
  cur = head;
  while (i < count - k) {
    cur = cur.next;
    i++;
  }
  const newHead = cur.next;
  cur.next = null;
  tail.next = head;
  return newHead;
};
// @lc code=end



// @lcpr case=start
// [1,2,3,4,5]\n2\n
// @lcpr case=end

// @lcpr case=start
// [1,2,3,4,5]\n5\n
// @lcpr case=end

// @lcpr case=start
// [1,2,3,4,5]\n4\n
// @lcpr case=end

// @lcpr case=start
// [0,1,2]\n4\n
// @lcpr case=end

// @lcpr case=start
// []\n5\n
// @lcpr case=end

// @lcpr case=start
// [1]\n5\n
// @lcpr case=end

// @lcpr case=start
// [0,1,2]\n0\n
// @lcpr case=end
