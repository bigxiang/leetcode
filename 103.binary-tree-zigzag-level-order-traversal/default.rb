#
# @lc app=leetcode.cn id=103 lang=ruby
# @lcpr version=30204
#
# [103] 二叉树的锯齿形层序遍历
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
# @return {Integer[][]}
def zigzag_level_order(root)
  result = []
  queue = [root]
  direction = 1
  while queue.any?
    curr_queue = queue.dup
    queue.clear

    curr_level = []
    curr_queue.each do |node|
      curr_level << node.val

      queue << node.left if node.left
      queue << node.right if node.right
    end

    curr_level.reverse! if direction == -1
    result << curr_level

    direction *= -1
  end

  result
end
# @lc code=end

#
# @lcpr case=start
# [3,9,20,null,null,15,7]\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4,null,null,5]\n
# @lcpr case=end

# @lcpr case=start
# [1]\n
# @lcpr case=end

# @lcpr case=start
# []\n
# @lcpr case=end

#
