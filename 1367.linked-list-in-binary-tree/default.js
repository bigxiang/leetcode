/*
 * @lc app=leetcode.cn id=1367 lang=javascript
 * @lcpr version=30204
 *
 * [1367] 二叉树中的链表
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
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {ListNode} head
 * @param {TreeNode} root
 * @return {boolean}
 */
var isSubPath = function(head, root) {
  return travel(root, head);
};

var travel = function(node, head) {
  if (!node) return false;
  if (isMatch(node, head)) return true;

  return travel(node.left, head) || travel(node.right, head);
}

var isMatch = function(node, head) {
  if (!node && head) return false;
  if (!head) return true;

  return node.val === head.val && (isMatch(node.left, head.next) || isMatch(node.right, head.next));
}
// @lc code=end

// @lcpr case=start
// [4,2,8]\n[1,4,4,null,2,2,null,1,null,6,8,null,null,null,null,1,3]\n
// @lcpr case=end

// @lcpr case=start
// [1,4,2,6]\n[1,4,4,null,2,2,null,1,null,6,8,null,null,null,null,1,3]\n
// @lcpr case=end

// @lcpr case=start
// [1,4,2,6,8]\n[1,4,4,null,2,2,null,1,null,6,8,null,null,null,null,1,3]\n
// @lcpr case=end


