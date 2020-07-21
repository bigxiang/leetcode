#
# @lc app=leetcode id=95 lang=ruby
#
# [95] Unique Binary Search Trees II
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
# @param {Integer} n
# @return {TreeNode[]}
def generate_trees(n)
  return [] if n == 0

  build_trees(1, n)
end

def build_trees(start_value, end_value)
  return [nil] if start_value > end_value

  trees = []
  start_value.upto(end_value) do |v|
    left_trees = build_trees(start_value, v-1)
    right_trees = build_trees(v+1, end_value)

    left_trees.each do |left_tree|
      right_trees.each do |right_tree|
        trees << TreeNode.new(v).tap do |tree|
          tree.left = left_tree
          tree.right = right_tree
        end
      end
    end
  end

  trees
end
# @lc code=end

