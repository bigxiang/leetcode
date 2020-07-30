#
# @lc app=leetcode id=589 lang=ruby
#
# [589] N-ary Tree Preorder Traversal
#

# @lc code=start
# Definition for a Node.
# class Node
#     attr_accessor :val, :children
#     def initialize(val)
#         @val = val
#         @children = []
#     end
# end

# @param {Node} root
# @return {List[int]}
def preorder(root)
  return [] if root.nil?

  result = []
  stack = [root]
  while stack.any?
    node = stack.pop
    result << node.val

    node.children.reverse_each { |c| stack.push(c) }
  end

  result
end
# @lc code=end

