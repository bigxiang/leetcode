#
# @lc app=leetcode.cn id=230 lang=ruby
# @lcpr version=30204
#
# [230] 二叉搜索树中第 K 小的元素
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
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k)
  result = []
  dfs(root, k, result)
  result.last
end

def dfs(root, k, result)
  return if root.nil?

  dfs(root.left, k, result)
  return if result.size == k

  result << root.val
  return if result.size == k

  dfs(root.right, k, result)
end
# @lc code=end

#
# @lcpr case=start
# [3,1,4,null,2]\n1\n
# @lcpr case=end

# @lcpr case=start
# [5,3,6,2,4,null,null,1]\n3\n
# @lcpr case=end

#
