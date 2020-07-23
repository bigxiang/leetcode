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

  memo = Array.new(grid.size) { Array.new(grid[0].size, 0) }
  dfs(grid, grid.size-1, grid[0].size-1, memo)
end

def dfs(grid, i, j, memo)
  if i == 0 && j == 0
    return memo[i][j] = grid[i][j]
  end

  return memo[i][j] if memo[i][j] > 0

  memo[i][j] = [
    (dfs(grid, i, j-1, memo) + grid[i][j] if j > 0),
    (dfs(grid, i-1, j, memo) + grid[i][j] if i > 0)
  ].compact.min
end
# @lc code=end

