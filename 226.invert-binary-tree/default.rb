#
# @lc app=leetcode.cn id=226 lang=ruby
# @lcpr version=30204
#
# [226] 翻转二叉树
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
# @return {TreeNode}
def invert_tree(root)
  return if root.nil?

  root.left, root.right = root.right, root.left
  invert_tree(root.left)
  invert_tree(root.right)

  root
end
# @lc code=end

#
# @lcpr case=start
# [4,2,7,1,3,6,9]\n
# @lcpr case=end

# @lcpr case=start
# [2,1,3]\n
# @lcpr case=end

# @lcpr case=start
# []\n
# @lcpr case=end

#
