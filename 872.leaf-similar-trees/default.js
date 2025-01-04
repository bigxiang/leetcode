/*
 * @lc app=leetcode.cn id=872 lang=javascript
 * @lcpr version=30204
 *
 * [872] 叶子相似的树
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
 * @param {TreeNode} root1
 * @param {TreeNode} root2
 * @return {boolean}
 */
var leafSimilar = function(root1, root2) {
  const leaves1 = getLeaves(root1);
  const leaves2 = getLeaves(root2);

  return leaves1.join(',') === leaves2.join(',');
};

var getLeaves = function(root) {
  const leaves = [];

  dfs(root, leaves);

  return leaves;
}

var dfs = function(root, leaves) {
  if (!root.left && !root.right) {
    leaves.push(root.val);
    return;
  }

  if (root.left) dfs(root.left, leaves);
  if (root.right) dfs(root.right, leaves);
}
// @lc code=end



// @lcpr case=start
// [3,5,1,6,2,9,8,null,null,7,4]\n[3,5,1,6,7,4,2,null,null,null,null,null,null,9,8]\n
// @lcpr case=end

// @lcpr case=start
// [1,2,3]\n[1,3,2]\n
// @lcpr case=end


