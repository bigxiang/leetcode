#
# @lc app=leetcode id=200 lang=ruby
#
# [200] Number of Islands
#

# @lc code=start
# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  count = 0

  grid.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      next if cell == '0'

      erase_island(grid, i, j)
      count += 1
    end
  end

  count
end

def erase_island(grid, i, j)
  return if grid[i][j] == '0'

  grid[i][j] = '0'

  erase_island(grid, i-1, j) if i > 0
  erase_island(grid, i, j-1) if j > 0
  erase_island(grid, i+1, j) if i < grid.size-1
  erase_island(grid, i, j+1) if j < grid[0].size-1

end
# @lc code=end

