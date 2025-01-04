/*
 * @lc app=leetcode.cn id=450 lang=javascript
 * @lcpr version=30204
 *
 * [450] 删除二叉搜索树中的节点
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
 * @param {number} key
 * @return {TreeNode}
 */
var deleteNode = function(root, key) {
  if (!root) return null;

  const [node, parent] = findNode(root, null, key);
  if (!node) return root;
  if (!parent) return delNode(node, parent);

  delNode(node, parent);
  return root;
};

var findNode = function(root, parent, key) {
  if (!root) return [];

  if (root.val === key) {
    return [root, parent];
  }
  else if (root.val > key) {
    return findNode(root.left, root, key);
  }
  else {
    return findNode(root.right, root, key);
  }
}

var delNode = function(root, parent) {
  if (!parent) {
    if (!root.left) return root.right;
    if (!root.right) return root.left;

    const minNode = findMin(root.right);
    minNode.left = root.left;
    return root.right;
  }

  if (!parent || root === parent.left && !root.right) {
    parent.left = root.left;
    return parent.left;
  }

  if (root === parent.right && !root.left) {
    parent.right = root.right;
    return parent.right;
  }

  if (root === parent.left) {
    const minNode = findMin(root.right);
    minNode.left = root.left;
    parent.left = root.right;
    return parent.left;
  }
  else if (root === parent.right) {
    const maxNode = findMax(root.left);
    maxNode.right = root.right;
    parent.right = root.left;
    return parent.right;
  }
  else {
    throw new Error('WTF');
  }
}

var findMin = function(root) {
  if (!root) return null;
  if (!root.left) return root;
  return findMin(root.left);
}

var findMax = function(root) {
  if (!root) return null;
  if (!root.right) return root;
  return findMax(root.right);
}
// @lc code=end



// @lcpr case=start
// [5,3,6,2,4,null,7]\n3\n
// @lcpr case=end

// @lcpr case=start
// [5,3,6,2,4,null,7]\n0\n
// @lcpr case=end

// @lcpr case=start
// []\n0\n
// @lcpr case=end

// @lcpr case=start
// [0]\n0\n
// @lcpr case=end

// @lcpr case=start
// [5,3,6,2,4,null,7]\n5\n
// @lcpr case=end
