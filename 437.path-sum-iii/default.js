/*
 * @lc app=leetcode.cn id=437 lang=javascript
 * @lcpr version=30204
 *
 * [437] 路径总和 III
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
 * @param {number} targetSum
 * @return {number}
 */
var pathSum = function(root, targetSum) {
  if (!root) return 0;

  return dfs(root, targetSum, 0, {});
};

var dfs = function(root, targetSum, preSum, preSums) {
  if (!root) return 0;

  const sum = preSum + root.val;
  let count = 0;
  if (sum === targetSum) count += 1;
  if (preSums[sum - targetSum]) count += preSums[sum - targetSum];

  preSums[sum] = (preSums[sum] || 0) + 1;
  count += dfs(root.left, targetSum, sum, preSums);
  count += dfs(root.right, targetSum, sum, preSums);
  preSums[sum] -= 1;

  return count;
}
// @lc code=end



// @lcpr case=start
// [10,5,-3,3,2,null,11,3,-2,null,1]\n8\n
// @lcpr case=end

// @lcpr case=start
// [5,4,8,11,null,13,4,7,2,null,null,5,1]\n22\n
// @lcpr case=end

// @lcpr case=start
// [10,5,-3,3,2,null,11,3,-2,null,0]\n7\n
// @lcpr case=end
