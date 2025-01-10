#
# @lc app=leetcode.cn id=543 lang=ruby
# @lcpr version=30204
#
# [543] 二叉树的直径
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
# @return {Integer}
def diameter_of_binary_tree(root)
  @result = 0
  dfs = lambda { |root|
    return 0 if root.nil?

    left = dfs.call(root.left)
    right = dfs.call(root.right)
    @result = [@result, left + right].max
    [left, right].max + 1
  }

  dfs.call(root)
  @result
end
# @lc code=end

#
# @lcpr case=start
# [1,2,3,4,5]\n
# @lcpr case=end

# @lcpr case=start
# [1,2]\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4,5,null,null,6,7,8,9,10,11]\n
# @lcpr case=end
#
