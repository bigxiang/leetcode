#
# @lc app=leetcode id=64 lang=ruby
#
# [64] Minimum Path Sum
#

# @lc code=start
# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
  return 0 if grid.empty? || grid[0].empty?

  dp = Array.new(grid.size + 1) { Array.new(grid[0].size + 1, Float::INFINITY) }
  dp[0][1] = 0

  (1..grid.size).each do |i|
    (1..grid[0].size).each do |j|
      dp[i][j] = [dp[i-1][j], dp[i][j-1]].min + grid[i-1][j-1]
    end
  end

  dp[-1][-1]
end
# @lc code=end

puts min_path_sum([
  [1,3,1],
  [1,5,1],
  [4,2,1]
])
