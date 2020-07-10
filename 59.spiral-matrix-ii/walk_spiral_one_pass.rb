#
# @lc app=leetcode id=59 lang=ruby
#
# [59] Spiral Matrix II
#

# @lc code=start
# @param {Integer} n
# @return {Integer[][]}
def generate_matrix(n)
  matrix = Array.new(n) { Array.new(n, 0) }

  i, j, di, dj = 0, 0, 0, 1

  (1..n ** 2).each do |k|
    matrix[i][j] = k
    di, dj = dj, -di if matrix[(i + di) % n][(j + dj) % n] > 0

    i+= di
    j+= dj
  end

  matrix
end
# @lc code=end

