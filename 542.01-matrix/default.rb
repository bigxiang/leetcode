#
# @lc app=leetcode.cn id=542 lang=ruby
# @lcpr version=30204
#
# [542] 01 矩阵
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[][]} mat
# @return {Integer[][]}
def update_matrix(mat)
  m = mat.size
  n = mat[0].size
  queue = Thread::Queue.new
  distances = Array.new(m) { Array.new(n, -1) }
  visited = Array.new(m) { Array.new(n, false) }

  (0...m).each do |i|
    (0...n).each do |j|
      if mat[i][j] == 0
        queue << [[i, j], 0]
        visited[i][j] = true
      end
    end
  end

  while queue.size > 0
    (i, j), d = queue.pop
    distances[i][j] = d

    [[i - 1, j], [i, j - 1], [i + 1, j], [i, j + 1]].each do |x, y|
      if x >= 0 && x < m && y >= 0 && y < n && !visited[x][y]
        queue << [[x, y], d + 1]
        visited[x][y] = true
      end
    end
  end

  distances
end
# @lc code=end

#
# @lcpr case=start
# [[0,0,0],[0,1,0],[0,0,0]]\n
# @lcpr case=end

# @lcpr case=start
# [[0,0,0],[0,1,0],[1,1,1]]\n
# @lcpr case=end

#
