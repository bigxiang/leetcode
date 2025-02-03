#
# @lc app=leetcode.cn id=399 lang=ruby
# @lcpr version=30204
#
# [399] 除法求值
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String[][]} equations
# @param {Float[]} values
# @param {String[][]} queries
# @return {Float[]}
def calc_equation(equations, values, queries)
  graph = {}
  equations.each_with_index do |(u, v), i|
    graph[u] ||= []
    graph[u] << [v, values[i]]

    graph[v] ||= []
    graph[v] << [u, 1 / values[i]]
  end

  puts graph

  result = []
  queries.each do |(start, finish)|
    if !graph.key?(start) || !graph.key?(finish)
      result.push(-1.0)
      next
    end

    result.push(calc(graph, start, finish))
  end
  result
end

def calc(graph, start, finish)
  queue = [[start, 1]]
  visited = Set.new
  while queue.any?
    node, cur = queue.shift
    visited.add(node)

    (graph[node] || []).each do |(dest, v)|
      value = cur * v
      return value if dest == finish

      next if visited.include?(dest)

      queue.push([dest, value])
    end
  end

  -1.0
end
# @lc code=end

#
# @lcpr case=start
# [["a","b"],["b","c"]]\n[2.0,3.0]\n[["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]\n
# @lcpr case=end

# @lcpr case=start
# [["a","b"],["b","c"],["bc","cd"]]\n[1.5,2.5,5.0]\n[["a","c"],["c","b"],["bc","cd"],["cd","bc"]]\n
# @lcpr case=end

# @lcpr case=start
# [["a","b"]]\n[0.5]\n[["a","b"],["b","a"],["a","c"],["x","y"]]\n
# @lcpr case=end

#
