#
# @lc app=leetcode id=429 lang=ruby
#
# [429] N-ary Tree Level Order Traversal
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
# @return {List[List[int]]}
def levelOrder(root)
  return [] if root.nil?

  nodes = [root]
  result = []

  level_traversal(0, [root], result)

  result
end

def level_traversal(level, nodes, result)
  return if nodes.empty?

  next_level_nodes = []
  nodes.each do |node|
    result[level] ||= []
    result[level] << node.val
    node.children.each do |child|
      next_level_nodes << child
    end
  end

  level_traversal(level+1, next_level_nodes, result)
end
# @lc code=end

