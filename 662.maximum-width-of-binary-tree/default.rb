#
# @lc app=leetcode.cn id=662 lang=ruby
# @lcpr version=30204
#
# [662] 二叉树最大宽度
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
def width_of_binary_tree(root)
  max_width = 0
  queue = [[root, 1]]
  queue_i = 0
  while queue_i < queue.size
    curr_size = queue.size
    node, index = queue[queue_i]
    first_index = index
    while queue_i < curr_size
      node, index = queue[queue_i]
      queue_i += 1

      queue << [node.left, index * 2] if node.left
      queue << [node.right, index * 2 + 1] if node.right
    end
    last_index = index
    max_width = [max_width, last_index - first_index + 1].max
  end

  max_width
end
# @lc code=end

#
# @lcpr case=start
# [1,3,2,5,3,null,9]\n
# @lcpr case=end

# @lcpr case=start
# [1,3,2,5,null,null,9,6,null,7]\n
# @lcpr case=end

# @lcpr case=start
# [1,3,2,5]\n
# @lcpr case=end

# @lcpr case=start
# [1]\n
# @lcpr case=end
#
