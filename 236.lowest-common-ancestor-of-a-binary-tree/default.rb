#
# @lc app=leetcode id=236 lang=ruby
#
# [236] Lowest Common Ancestor of a Binary Tree
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
  return if root.nil?
  return root if root.val == p.val || root.val == q.val

  left = lowest_common_ancestor(root.left, p, q)
  right = lowest_common_ancestor(root.right, p, q)

  return root if left && right

  left || right
end

# @lc code=end

# @lcpr case=start
# [3,5,1,6,2,0,8,null,null,7,4]\n5\n1\n
# @lcpr case=end

# @lcpr case=start
# [3,5,1,6,2,0,8,null,null,7,4]\n5\n4\n
# @lcpr case=end

# @lcpr case=start
# [1,2]\n1\n2\n
# @lcpr case=end
