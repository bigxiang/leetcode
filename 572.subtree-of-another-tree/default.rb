#
# @lc app=leetcode.cn id=572 lang=ruby
# @lcpr version=30204
#
# [572] 另一棵树的子树
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
# @param {TreeNode} sub_root
# @return {Boolean}
def is_subtree(root, sub_root)
  return false if root.nil?

  result = check(root, sub_root) if root.val == sub_root.val
  result || is_subtree(root.left, sub_root) || is_subtree(root.right, sub_root)
end

def check(root, sub_root)
  return true if root.nil? && sub_root.nil?
  return false if root.nil? || sub_root.nil?
  return false if root.val != sub_root.val

  check(root.left, sub_root.left) && check(root.right, sub_root.right)
end

# @lc code=end

#
# @lcpr case=start
# [3,4,5,1,2]\n[4,1,2]\n
# @lcpr case=end

# @lcpr case=start
# [3,4,5,1,2,null,null,null,null,0]\n[4,1,2]\n
# @lcpr case=end

#
