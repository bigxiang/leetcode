#
# @lc app=leetcode.cn id=133 lang=ruby
# @lcpr version=30204
#
# [133] 克隆图
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# Definition for a Node.
# class Node
#     attr_accessor :val, :neighbors
#     def initialize(val = 0, neighbors = nil)
#		  @val = val
#		  neighbors = [] if neighbors.nil?
#         @neighbors = neighbors
#     end
# end

# @param {Node} node
# @return {Node}
def cloneGraph(node)
  return nil if node.nil?

  nodes = Array.new(101)
  visited = Array.new(101, false)
  queue = Thread::Queue.new
  queue << node
  while queue.size > 0
    n = queue.pop
    next if visited[n.val]

    nodes[n.val] ||= Node.new(n.val)
    n.neighbors.each do |neighbor|
      nodes[neighbor.val] ||= Node.new(neighbor.val)
      nodes[n.val].neighbors << nodes[neighbor.val]
      queue << neighbor
    end
    visited[n.val] = true
  end
  nodes[1]
end
# @lc code=end

#
# @lcpr case=start
# [[2,4],[1,3],[2,4],[1,3]]\n
# @lcpr case=end

# @lcpr case=start
# [[]]\n
# @lcpr case=end

# @lcpr case=start
# []\n
# @lcpr case=end

#
