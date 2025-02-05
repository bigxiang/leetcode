#
# @lc app=leetcode.cn id=994 lang=ruby
# @lcpr version=30204
#
# [994] 腐烂的橘子
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[][]} grid
# @return {Integer}
def oranges_rotting(grid)
  fresh_count = 0
  grid.each do |row|
    row.each do |cell|
      fresh_count += 1 if cell == 1
    end
  end
  return 0 if fresh_count.zero?

  queue = []
  grid.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      queue.push([i, j]) if cell == 2
    end
  end

  time = 0
  while queue.any?
    queue.size.times do
      i, j = queue.shift

      [[0, -1], [0, 1], [-1, 0], [1, 0]].each do |di, dj|
        new_i = i + di
        new_j = j + dj
        next unless new_i >= 0 && new_i < grid.size && new_j >= 0 && new_j < grid[0].size && grid[new_i][new_j] == 1

        grid[new_i][new_j] = 2
        fresh_count -= 1
        queue.push([new_i, new_j])
      end
    end

    time += 1
    return time if fresh_count.zero?
  end
  -1
end
# @lc code=end

#
# @lcpr case=start
# [[2,1,1],[1,1,0],[0,1,1]]\n
# @lcpr case=end

# @lcpr case=start
# [[2,1,1,0],[1,1,0,1],[0,1,1,2],[1,2,1,1]]\n
# @lcpr case=end

# @lcpr case=start
# [[2,1,1],[0,1,1],[1,0,1]]\n
# @lcpr case=end

# @lcpr case=start
# [[0,2]]\n
# @lcpr case=end

#
