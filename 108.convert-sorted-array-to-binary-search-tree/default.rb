#
# @lc app=leetcode id=108 lang=ruby
#
# [108] Convert Sorted Array to Binary Search Tree
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
# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
  convert_to_bst(nums, 0, nums.size-1)
end

def convert_to_bst(nums, lo, hi)
  return if lo > hi

  mi = (lo + hi) / 2
  result = TreeNode.new(nums[mi])
  result.left = convert_to_bst(nums, lo, mi-1)
  result.right = convert_to_bst(nums, mi+1, hi)
  result
end

# @lc code=end

