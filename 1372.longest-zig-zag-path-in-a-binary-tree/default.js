/*
 * @lc app=leetcode.cn id=1372 lang=javascript
 * @lcpr version=30204
 *
 * [1372] 二叉树中的最长交错路径
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
var longestZigZag = function(root) {
  let result = [0];

  dfs(root.left, 0, 1, result);
  dfs(root.right, 0, 0, result);

  return result[0];
};

var dfs = function(root, len, direction, result) {
  if (!root) {
    result[0] = Math.max(result[0], len);
    return;
  }

  if (direction === 0) {
    dfs(root.left, len+1, 1, result);
    dfs(root.right, 0, 0, result);
  }
  else {
    dfs(root.left, 0, 1, result);
    dfs(root.right, len+1, 0, result);
  }
}
// @lc code=end



// @lcpr case=start
// [1,null,1,1,1,null,null,1,1,null,1,null,null,null,1,null,1]\n
// @lcpr case=end

// @lcpr case=start
// [1,1,1,null,1,null,null,1,1,null,1]\n
// @lcpr case=end

// @lcpr case=start
// [1]\n
// @lcpr case=end

// @lcpr case=start
// [6,9,7,3,null,2,8,5,8,9,7,3,9,9,4,2,10,null,5,4,3,10,10,9,4,1,2,null,null,6,5,null,null,null,null,9,null,9,6,5,null,5,null,null,7,7,4,null,1,null,null,3,7,null,9,null,null,null,null,null,null,null,null,9,9,null,null,null,7,null,null,null,null,null,null,null,null,null,6,8,7,null,null,null,3,10,null,null,null,null,null,1,null,1,2]\n
// @lcpr case=end
