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
  in_degrees = Array.new(num_courses, 0)
  prerequisites.each do |(u, v)|
    graph[v].push(u)
    in_degrees[u] += 1
  end
  queue = []
  in_degrees.each_with_index do |d, i|
    queue << i if d == 0
  end

  while queue.size > 0
    n = queue[0]
    queue = queue[1..]

    graph[n].each do |nn|
      in_degrees[nn] -= 1
      queue << nn if in_degrees[nn] == 0
    end
  end

  in_degrees.none? { |d| d > 0 }
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
