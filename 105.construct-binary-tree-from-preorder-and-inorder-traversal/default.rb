#
# @lc app=leetcode.cn id=105 lang=ruby
# @lcpr version=30204
#
# [105] 从前序与中序遍历序列构造二叉树
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
# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  inorder_map = inorder.each_with_index.to_h

  dfs(preorder, 0, preorder.size - 1, inorder, 0, inorder.size - 1, inorder_map)
end

def dfs(preorder, pl, pr, inorder, il, ir, inorder_map)
  return if pl > pr

  root = TreeNode.new(preorder[pl])
  mid = inorder_map[root.val]
  left_size = mid - il
  right_size = ir - mid
  root.left = dfs(preorder, pl + 1, pl + left_size, inorder, il, mid - 1, inorder_map)
  root.right = dfs(preorder, pl + left_size + 1, pr, inorder, mid + 1, ir, inorder_map)
  root
end
# @lc code=end

#
# @lcpr case=start
# [3,9,20,15,7]\n[9,3,15,20,7]\n
# @lcpr case=end

# @lcpr case=start
# [-1]\n[-1]\n
# @lcpr case=end

#
