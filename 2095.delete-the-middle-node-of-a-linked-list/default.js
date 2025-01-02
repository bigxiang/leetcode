/*
 * @lc app=leetcode.cn id=2095 lang=javascript
 * @lcpr version=30204
 *
 * [2095] 删除链表的中间节点
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
 * @return {ListNode}
 */
var deleteMiddle = function(head) {
  if (!head.next) return null;

  const dummy = new ListNode(0, head);
  let slow = head, fast = dummy, prev = dummy;
  while (fast.next && fast.next.next) {
    slow = slow.next;
    fast = fast.next.next;
    prev = prev.next;
  }
  prev.next = slow.next;

  return head;
};
// @lc code=end



// @lcpr case=start
// [1,3,4,7,1,2,6]\n
// @lcpr case=end

// @lcpr case=start
// [1,2,3,4]\n
// @lcpr case=end

// @lcpr case=start
// [2,1]\n
// @lcpr case=end

// @lcpr case=start
// [2]\n
// @lcpr case=end
