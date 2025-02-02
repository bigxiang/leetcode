#
# @lc app=leetcode.cn id=199 lang=ruby
# @lcpr version=30204
#
# [199] 二叉树的右视图
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
# @return {Integer[]}
def right_side_view(root)
  return [] if root.nil?

  result = []
  queue = [root]
  while queue.any?
    node = nil
    queue.size.times do
      node = queue.shift
      queue << node.left if node.left
      queue << node.right if node.right
    end
    result << node.val
  end

  result
end
# @lc code=end

#
# @lcpr case=start
# [1,2,3,null,5,null,4]\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4,null,null,null,5]\n
# @lcpr case=end

# @lcpr case=start
# [1,null,3]\n
# @lcpr case=end

# @lcpr case=start
# []\n
# @lcpr case=end

#
