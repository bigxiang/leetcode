#
# @lc app=leetcode id=221 lang=ruby
#
# [221] Maximal Square
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
  dp = Array.new(matrix.size) { Array.new(matrix[0].size, 0) }
  max = 0

  (0...matrix.size).each do |i|
    (0...matrix[0].size).each do |j|
      next if matrix[i][j] == '0'

      dp[i][j] = if i == 0 || j == 0
                   1
                 else
                   [dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]].min + 1
                 end

      max = [max, dp[i][j]].max
    end
  end

  max**2
end
# @lc code=end

# @lcpr case=start
# [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]\n
# @lcpr case=end

# @lcpr case=start
# [["0","1"],["1","0"]]\n
# @lcpr case=end

# @lcpr case=start
# [["0"]]\n
# @lcpr case=end
