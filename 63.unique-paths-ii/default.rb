#
# @lc app=leetcode id=63 lang=ruby
#
# [63] Unique Paths II
#

# @lc code=start
# @param {Integer[][]} obstacle_grid
# @return {Integer}
def unique_paths_with_obstacles(obstacle_grid)
  return 0 if obstacle_grid.empty? || obstacle_grid[0].empty?

  rows = obstacle_grid.size
  columns = obstacle_grid[0].size

  dp = Array.new(columns + 1, 0)
  dp[0] = 1

  rows.times do |row|
    obstacle_grid[row].each_with_index do |cell, j|
      dp[j+1] = cell.zero? ? dp[j+1] + dp[j] : 0
    end
    dp[0] = 0
  end

  dp[-1]
end
# @lc code=end

puts unique_paths_with_obstacles(
  [[0,0,0],[0,1,0],[0,0,0]]
)
