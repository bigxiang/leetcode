#
# @lc app=leetcode.cn id=207 lang=ruby
# @lcpr version=30204
#
# [207] 课程表
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
  graph = Array.new(num_courses) { [] }
  visited = Array.new(num_courses, 0)
  prerequisites.each { |(u, v)| graph[v].push(u) }
  (0...num_courses).each do |n|
    return false unless dfs(graph, visited, n)
  end
  true
end

def dfs(graph, visited, n)
  visited[n] = 1
  graph[n].each do |nn|
    if visited[nn] == 0
      return false unless dfs(graph, visited, nn)
    elsif visited[nn] == 1
      return false
    end
  end
  visited[n] = 2
  true
end
# @lc code=end

#
# @lcpr case=start
# 2\n[[1,0]]\n
# @lcpr case=end

# @lcpr case=start
# 2\n[[1,0],[0,1]]\n
# @lcpr case=end

# @lcpr case=start
# 4\n[[1,0],[1,2],[0,2]]\n
# @lcpr case=end

# @lcpr case=start
# 3\n[[0,1],[0,2],[1,2],[2,1]]\n
# @lcpr case=end

#
