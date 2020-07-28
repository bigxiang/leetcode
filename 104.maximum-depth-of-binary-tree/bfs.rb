#
# @lc app=leetcode id=104 lang=ruby
#
# [104] Maximum Depth of Binary Tree
#

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
# @return {Integer}
def max_depth(root)
  return 0 if root.nil?

  level = 0
  queue = [[root, 1]]
  while queue.any?
    node, level = queue.shift
    queue << [node.left, level+1] if node.left
    queue << [node.right, level+1] if node.right
  end
  level
end
# @lc code=end

