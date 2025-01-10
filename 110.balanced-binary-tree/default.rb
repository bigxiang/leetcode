#
# @lc app=leetcode id=110 lang=ruby
#
# [110] Balanced Binary Tree
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
def is_balanced(root)
  dfs(root, 0)[0]
end

def dfs(root, level)
  return [true, level] if root.nil?

  left_balanced, left_level = dfs(root.left, level + 1)
  right_balanced, right_level = dfs(root.right, level + 1)
  diff = left_level - right_level
  balanced = left_balanced && right_balanced && diff.abs <= 1

  [balanced, [left_level, right_level].max]
end
# @lc code=end

# @lcpr case=start
# [1,2,2,3,3,null,null,4,4]\n
# @lcpr case=end

# @lcpr case=start
# [3,9,20,null,null,15,7]\n
# @lcpr case=end

# @lcpr case=start
# []\n
# @lcpr case=end
