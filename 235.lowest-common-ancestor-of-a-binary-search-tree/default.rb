#
# @lc app=leetcode.cn id=235 lang=ruby
# @lcpr version=30204
#
# [235] 二叉搜索树的最近公共祖先
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
  if root.val > p.val && root.val < q.val ||
     root.val < p.val && root.val > q.val ||
     root.val == p.val ||
     root.val == q.val
    return root
  end

  return lowest_common_ancestor(root.left, p, q) if root.val > p.val && root.val > q.val

  lowest_common_ancestor(root.right, p, q)
end
# @lc code=end

#
# @lcpr case=start
# [6,2,8,0,4,7,9,null,null,3,5]\n2\n8\n
# @lcpr case=end

# @lcpr case=start
# [6,2,8,0,4,7,9,null,null,3,5]\n2\n4\n
# @lcpr case=end

# @lcpr case=start
# [6,2,8,0,4,7,9,null,null,3,5]\n2\n0\n
# @lcpr case=end

# @lcpr case=start
# [6,2,8,0,4,7,9,null,null,3,5]\n3\n0\n
# @lcpr case=end

# @lcpr case=start
# [6,2,8,0,4,7,9,null,null,3,5]\n8\n9\n
# @lcpr case=end

#
