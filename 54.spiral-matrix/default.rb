#
# @lc app=leetcode.cn id=54 lang=ruby
# @lcpr version=30204
#
# [54] 螺旋矩阵
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  m = matrix.size
  n = matrix[0].size
  return matrix[0] if m == 1

  directions = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  min_point = [0, -1]
  max_point = [m - 1, n - 1]
  direction = 0
  i, j = min_point
  (0...m * n).map do |_|
    i += directions[direction % 4][0]
    j += directions[direction % 4][1]

    if i == min_point[0] && j == max_point[1]
      direction += 1
    elsif i == max_point[0] && j == max_point[1]
      direction += 1
      min_point[0] += 1
      min_point[1] += 1
    elsif i == max_point[0] && j == min_point[1]
      direction += 1
    elsif i == min_point[0] && j == min_point[1]
      direction += 1
      max_point[0] -= 1
      max_point[1] -= 1
    end

    matrix[i][j]
  end
end
# @lc code=end

#
# @lcpr case=start
# [[1,2,3],[4,5,6],[7,8,9]]\n
# @lcpr case=end

# @lcpr case=start
# [[1,2,3,4],[5,6,7,8],[9,10,11,12]]\n
# @lcpr case=end

# @lcpr case=start
# [[1,2,3,4,5]]\n
# @lcpr case=end

# @lcpr case=start
# [[1],[2],[3],[4]]\n
# @lcpr case=end

# @lcpr case=start
# [[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20],[21,22,23,24,25]]\n
# @lcpr case=end

#
