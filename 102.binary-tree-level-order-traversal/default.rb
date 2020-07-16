#
# @lc app=leetcode id=102 lang=ruby
#
# [102] Binary Tree Level Order Traversal
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
# @return {Integer[][]}
def level_order(root)
  result = []

  queue = [root]
  while queue.any?
    current_level = queue.dup
    queue.clear

    result << current_level.map do |node|
      queue << node.left if node.left
      queue << node.right if node.right
      node.val
    end
  end

  result
end
# @lc code=end

