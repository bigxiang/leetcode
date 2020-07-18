#
# @lc app=leetcode id=559 lang=ruby
#
# [559] Maximum Depth of N-ary Tree
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
# @return {int}
def maxDepth(root)
  return 0 if root.nil?

  bfs[root]
end

def bfs(node)
  level = 0
  nodes_in_current_level = [node]

  while nodes_in_current_level.any?
    nodes_in_next_level = []
    nodes_in_current_level.each do |node|
      node.children.each do |child|
        nodes_in_next_level << child
      end
    end
    level += 1
    nodes_in_current_level = nodes_in_next_level
  end

  level
end
# @lc code=end

