/*
 * @lc app=leetcode.cn id=199 lang=javascript
 * @lcpr version=30204
 *
 * [199] 二叉树的右视图
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {number[]}
 */
var rightSideView = function(root) {
  if (!root) return [];

  const result = [];
  const queue = [root];
  let queue_i = 0;

  while (queue_i < queue.length) {
    let levelLength = queue.length - queue_i;
    let levelIndex = queue_i + levelLength;
    let node = null;

    while (queue_i < levelIndex) {
      node = queue[queue_i++];

      if (node.left) queue.push(node.left);
      if (node.right) queue.push(node.right);
    }

    result.push(node.val);
  }

  return result;
};
// @lc code=end



// @lcpr case=start
// [1,2,3,null,5,null,4]\n
// @lcpr case=end

// @lcpr case=start
// [1,2,3,4,null,null,null,5]\n
// @lcpr case=end

// @lcpr case=start
// [1,null,3]\n
// @lcpr case=end

// @lcpr case=start
// []\n
// @lcpr case=end


