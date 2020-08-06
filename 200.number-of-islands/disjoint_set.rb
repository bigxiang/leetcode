#
# @lc app=leetcode id=200 lang=ruby
#
# [200] Number of Islands
#

# @lc code=start
# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  return 0 if grid.empty? || grid[0].empty?

  m = grid.size
  n = grid[0].size
  set = DisjointSet.new(m * n)

  m.times do |i|
    n.times do |j|
      next if grid[i][j] == '0'

      set.add(to_index(i, j, n))
    end
  end

  m.times do |i|
    n.times do |j|
      next if grid[i][j] == '0'

      [[0,1], [1,0], [-1,0], [0,-1]].each do |di, dj|
        if i + di >= 0 && i + di < m && j + dj >= 0 && j + dj < n && grid[i+di][j+dj] == '1'
          set.union(to_index(i, j, n), to_index(i+di, j+dj, n))
        end
      end
    end
  end

  set.count
end

def to_index(i, j, n)
  i * n + j
end

class DisjointSet
  attr_reader :count, :parents, :ranks

  def initialize(n)
    @count = 0
    @parents = Array.new(n)
    @ranks = Array.new(n)
  end

  def add(x)
    parents[x] = x
    ranks[x] = 1
    @count += 1
  end

  def find(x)
    if parents[x] != x
      parents[x] = find(parents[x])
    end
    parents[x]
  end

  def union(x, y)
    root_x = find(x)
    root_y = find(y)

    return if root_x == root_y

    if ranks[root_x] > ranks[root_y]
      parents[root_y] = root_x
    elsif ranks[root_x] < ranks[root_y]
      parents[root_x] = root_y
    else
      parents[root_y] = root_x
      ranks[root_x] += 1
    end

    @count -= 1
  end
end
# @lc code=end

puts num_islands([["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]])
