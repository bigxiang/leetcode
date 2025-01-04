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

  let count = 0;

  count += dfs(root, targetSum);
  count += pathSum(root.left, targetSum);
  count += pathSum(root.right, targetSum);

  return count;
};

var dfs = function(root, targetSum) {
  if (!root) return 0;

  let count = 0;
  if (targetSum === root.val) {
    count++;
  }

  count += dfs(root.left, targetSum - root.val);
  count += dfs(root.right, targetSum - root.val);

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
