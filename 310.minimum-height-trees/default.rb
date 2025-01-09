#
# @lc app=leetcode.cn id=310 lang=ruby
# @lcpr version=30204
#
# [310] 最小高度树
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[]}
def find_min_height_trees(n, edges)
  return [0] if edges.empty?

  graph = {}
  edges.each do |u, v|
    graph[u] ||= []
    graph[u] << v

    graph[v] ||= []
    graph[v] << u
  end

  start_node = edges[0][0]
  visited = Set.new
  queue = [start_node]
  queue_i = 0
  while queue_i < graph.keys.size
    node = queue[queue_i]
    queue_i += 1

    visited.add(node)
    graph[node].each do |n|
      queue << n unless visited.include?(n)
    end
  end

  start_node = queue.last
  visited = Set.new
  queue = [start_node]
  queue_i = 0
  parents = {}
  while queue_i < graph.keys.size
    node = queue[queue_i]
    queue_i += 1

    visited.add(node)
    graph[node].each do |n|
      unless visited.include?(n)
        parents[n] = node
        queue << n
      end
    end
  end

  end_node = queue.last
  path = []
  node = end_node
  while node
    path << node
    node = parents[node]
  end

  if path.size.even?
    [path[path.size / 2 - 1], path[path.size / 2]]
  else
    [path[path.size / 2]]
  end
end
# @lc code=end

#
# @lcpr case=start
# 4\n[[1,0],[1,2],[1,3]]\n
# @lcpr case=end

# @lcpr case=start
# 6\n[[3,0],[3,1],[3,2],[3,4],[5,4]]\n
# @lcpr case=end

# @lcpr case=start
# 1\n[]\n
# @lcpr case=end

# @lcpr case=start
# 2\n[[1,0]]\n
# @lcpr case=end

#
