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

  dp = Array.new(grid[0].size + 1) { Float::INFINITY }
  dp[0] = 0

  (0..grid.size-1).each do |i|
    (0..grid[0].size-1).each do |j|
      dp[j+1] = [dp[j], dp[j+1]].min + grid[i][j]
    end
    dp[0] = dp[1]
  end

  dp[-1]
end
# @lc code=end

puts min_path_sum([
  [1,3,1],
  [1,5,1],
  [4,2,1]
])
