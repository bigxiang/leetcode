#
# @lc app=leetcode.cn id=450 lang=ruby
# @lcpr version=30204
#
# [450] 删除二叉搜索树中的节点
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
# @param {Integer} key
# @return {TreeNode}
def delete_node(root, key)
  node, parent = find_node(root, nil, key)
  return root if node.nil?

  if node.left.nil? && node.right.nil?
    return if parent.nil?

    parent.val > key ? parent.left = nil : parent.right = nil
  elsif node.left.nil?
    return node.right if parent.nil?

    parent.val > key ? parent.left = node.right : parent.right = node.right
  elsif node.right.nil?
    return node.left if parent.nil?

    parent.val > key ? parent.left = node.left : parent.right = node.left
  else
    left = node.left
    right = node.right
    right_min = find_min(right)
    right_min.left = left
    return right if parent.nil?

    parent.val > key ? parent.left = right : parent.right = right
  end

  root
end

def find_node(root, parent, key)
  return if root.nil?
  return [root, parent] if root.val == key

  root.val < key ? find_node(root.right, root, key) : find_node(root.left, root, key)
end

def find_min(root)
  cur = root
  cur = cur.left while cur.left
  cur
end
# @lc code=end

#
# @lcpr case=start
# [5,3,6,2,4,null,7]\n3\n
# @lcpr case=end

# @lcpr case=start
# [5,3,6,2,4,null,7]\n0\n
# @lcpr case=end

# @lcpr case=start
# []\n0\n
# @lcpr case=end

# @lcpr case=start
# [0]\n0\n
# @lcpr case=end

# @lcpr case=start
# [5,3,6,2,4,null,7]\n5\n
# @lcpr case=end

#
