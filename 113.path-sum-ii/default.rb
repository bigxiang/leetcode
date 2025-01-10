#
# @lc app=leetcode.cn id=113 lang=ruby
# @lcpr version=30204
#
# [113] 路径总和 II
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
# @return {Integer[][]}
def path_sum(root, target_sum)
  return [] if root.nil?

  result = []
  dfs(root, target_sum, [], result)
  result
end

def dfs(root, target_sum, seq, result)
  if root.left.nil? && root.right.nil? && target_sum == root.val
    result << (seq + [root.val])
    return
  end

  dfs(root.left, target_sum - root.val, seq + [root.val], result) if root.left
  dfs(root.right, target_sum - root.val, seq + [root.val], result) if root.right
end
# @lc code=end

#
# @lcpr case=start
# [5,4,8,11,null,13,4,7,2,null,null,5,1]\n22\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3]\n5\n
# @lcpr case=end

# @lcpr case=start
# [1,2]\n0\n
# @lcpr case=end

# @lcpr case=start
# []\n0\n
# @lcpr case=end

# @lcpr case=start
# [1]\n0\n
# @lcpr case=end

#
