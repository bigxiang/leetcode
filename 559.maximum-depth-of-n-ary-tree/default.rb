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

  dfs(root, 1)
end

def dfs(node, level)
  return level if node.children.empty?

  node.children.map { |n| dfs(n, level+1) }.max
end
# @lc code=end

