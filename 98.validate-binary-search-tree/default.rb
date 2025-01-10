#
# @lc app=leetcode.cn id=98 lang=ruby
# @lcpr version=30204
#
# [98] 验证二叉搜索树
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
  dfs(root, -Float::INFINITY, Float::INFINITY)
end

def dfs(root, min, max)
  return true if root.nil?
  return false if root.left && root.left.val >= root.val
  return false if root.right && root.right.val <= root.val
  return false if root.val <= min || root.val >= max

  dfs(root.left, min, root.val) && dfs(root.right, root.val, max)
end
# @lc code=end

#
# @lcpr case=start
# [2,1,3]\n
# @lcpr case=end

# @lcpr case=start
# [5,1,4,null,null,3,6]\n
# @lcpr case=end

# @lcpr case=start
# [2,2,2]\n
# @lcpr case=end

# @lcpr case=start
# [5,4,6,null,null,3,7]\n
# @lcpr case=end

# @lcpr case=start
# [45,42,null,null,44,43,null,41]\n
# @lcpr case=end
#
