#
# @lc app=leetcode id=221 lang=ruby
#
# [221] Maximal Square
#

# @lc code=start
# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
  return 0 if matrix.empty? || matrix[0].empty?

  dp = Array.new(matrix.size + 1) { Array.new(matrix[0].size + 1, 0) }
  max_width = 0

  (1..matrix.size).each do |row|
    (1..matrix[0].size).each do |col|
      next if matrix[row-1][col-1] == '0'

      dp[row][col] = [dp[row-1][col-1], dp[row-1][col], dp[row][col-1]].min + 1
      max_width = [max_width, dp[row][col]].max
    end
  end

  max_width ** 2
end
# @lc code=end

