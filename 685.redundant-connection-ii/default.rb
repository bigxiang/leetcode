#
# @lc app=leetcode.cn id=685 lang=ruby
# @lcpr version=30204
#
# [685] 冗余连接 II
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[][]} edges
# @return {Integer[]}
def find_redundant_directed_connection(edges)
  graph = {}
  r_graph = {}
  edges.each do |edge|
    return edge if r_graph[edge[1]]

    r_graph[edge[1]] = edge[0]
    graph[edge[0]] ||= []
    graph[edge[0]] << edge[1]

    return edge if check_circle(graph, edge[0], edge[0])
  end
end

def check_circle(graph, start_point, end_point)
  return false unless graph[start_point]

  graph[start_point].each do |point|
    return true if point == end_point || check_circle(graph, point, end_point)
  end

  false
end
# @lc code=end

#
# @lcpr case=start
# [[1,2],[1,3],[2,3]]\n
# @lcpr case=end

# @lcpr case=start
# [[1,2],[2,3],[3,4],[4,1],[1,5]]\n
# @lcpr case=end

# @lcpr case=start
# [[1,2],[2,3],[4,5],[5,6],[6,4],[3,4]]\n
# @lcpr case=end

# @lcpr case=start
# [[1,2],[2,3],[1,5],[4,5],[5,6],[3,4]]\n
# @lcpr case=end

# @lcpr case=start
# [[1,2],[1,3],[2,4],[2,5],[3,6],[3,7],[7,1]]\n
# @lcpr case=end

# @lcpr case=start
# [[2,1],[3,1],[4,2],[1,4]]\n
# @lcpr case=end

# @lcpr case=start
# [[2,1],[3,1],[4,2],[4,3]]\n
# @lcpr case=end

#
