/*
 * @lc app=leetcode.cn id=1161 lang=javascript
 * @lcpr version=30204
 *
 * [1161] 最大层内元素和
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
 * @return {number}
 */
var maxLevelSum = function(root) {
  let maxSum = Number.MIN_SAFE_INTEGER;
  let result = 0;
  let queue = [root];
  let queue_i = 0;
  let level = 1;

  while (queue_i < queue.length) {
    let levelLength = queue.length - queue_i;
    let levelIndex = queue_i + levelLength;
    let levelSum = 0;

    while (queue_i < levelIndex) {
      const node = queue[queue_i++];
      levelSum += node.val;

      if (node.left) queue.push(node.left);
      if (node.right) queue.push(node.right);
    }

    if (levelSum > maxSum) {
      maxSum = levelSum;
      result = level;
    }

    level++;
  }

  return result;
};
// @lc code=end



// @lcpr case=start
// [1,7,0,7,-8,null,null]\n
// @lcpr case=end

// @lcpr case=start
// [989,null,10250,98693,-89388,null,null,null,-32127]\n
// @lcpr case=end


