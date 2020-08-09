#
# @lc app=leetcode id=1091 lang=ruby
#
# [1091] Shortest Path in Binary Matrix
#

# @lc code=start
# @param {Integer[][]} grid
# @return {Integer}
DIRS = [[1,1], [0,1], [1,0], [1,-1], [-1,1], [-1,0], [0,-1], [-1,-1]].freeze

def shortest_path_binary_matrix(grid)
  return -1 if grid[0][0] == 1 || grid[-1][-1] == 1
  return 1 if grid.size == 1

  n = grid.size
  start_set = Set.new([0])
  end_set = Set.new([n**2-1])
  length = 1

  while start_set.any? && end_set.any?
    length += 1
    if start_set.size > end_set.size
      start_set, end_set = end_set, start_set
    end

    new_set = Set.new
    start_set.each do |seq|
      i = seq / n
      j = seq % n
      grid[i][j] = 2

      DIRS.each do |di, dj|
        new_i = i + di
        new_j = j + dj
        if new_i >= 0 && new_i < n && new_j >= 0 && new_j < n && grid[new_i][new_j] == 0
          new_seq = new_i * n + new_j
          if end_set.include?(new_seq)
            return length
          else
            new_set << new_seq
          end
        end
      end
    end
    start_set = new_set
  end

  -1
end
# @lc code=end

