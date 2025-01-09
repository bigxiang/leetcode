#
# @lc app=leetcode.cn id=210 lang=ruby
# @lcpr version=30204
#
# [210] 课程表 II
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Integer[]}
def find_order(num_courses, prerequisites)
  visited = Array.new(num_courses, 0)
  graph = prerequisites.each_with_object({}) do |(u, v), h|
    h[u] ||= []
    h[u] << v
  end
  path = []

  (0...num_courses).each do |i|
    return [] unless dfs(graph, i, visited, path)
  end

  path
end

def dfs(graph, i, visited, path)
  return true if visited[i] == 2
  return false if visited[i] == 1

  visited[i] = 1
  (graph[i] || []).each do |j|
    return false unless dfs(graph, j, visited, path)
  end
  path << i
  visited[i] = 2
  true
end
# @lc code=end

#
# @lcpr case=start
# 2\n[[1,0]]\n
# @lcpr case=end

# @lcpr case=start
# 4\n[[1,0],[2,0],[3,1],[3,2]]\n
# @lcpr case=end

# @lcpr case=start
# 1\n[]\n
# @lcpr case=end

#
