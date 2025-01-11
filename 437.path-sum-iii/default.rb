#
# @lc app=leetcode.cn id=437 lang=ruby
# @lcpr version=30204
#
# [437] 路径总和 III
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
# @param {Integer} target_sum
# @return {Integer}
def path_sum(root, target_sum)
  dfs(root, 0, target_sum, {})
end

def dfs(root, pre, target_sum, pre_sums)
  return 0 if root.nil?

  count = 0
  sum = pre + root.val
  count += 1 if sum == target_sum
  count += pre_sums[sum - target_sum] || 0
  pre_sums[sum] = (pre_sums[sum] || 0) + 1
  count += dfs(root.left, sum, target_sum, pre_sums)
  count += dfs(root.right, sum, target_sum, pre_sums)
  pre_sums[sum] -= 1
  count
end
# @lc code=end

#
# @lcpr case=start
# [10,5,-3,3,2,null,11,3,-2,null,1]\n8\n
# @lcpr case=end

# @lcpr case=start
# [5,4,8,11,null,13,4,7,2,null,null,5,1]\n22\n
# @lcpr case=end

# @lcpr case=start
# []\n22\n
# @lcpr case=end

# @lcpr case=start
# [1]\n22\n
# @lcpr case=end

#
