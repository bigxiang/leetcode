#
# @lc app=leetcode id=547 lang=ruby
#
# [547] Friend Circles
#

# @lc code=start
# @param {Integer[][]} m
# @return {Integer}
def find_circle_num(m)
  set = DisjointSet.new(m.size)
  (0..m.size-1).each do |i|
    (i..m.size-1).each do |j|
      set.union(i, j) if m[i][j] == 1
    end
  end

  set.count
end

class DisjointSet
  attr_reader :count, :parents, :sizes

  def initialize(n)
    @count = n
    @parents = Array.new(n)
    @sizes = Array.new(n)
    n.times { |i| parents[i] = i; sizes[i] = 1; }
  end

  def find(x)
    if parents[x] != x
      parents[x] = find(parents[x])
    end
    # or
    # while parents[x] != x
    #   parents[x] = parents[parents[x]]
    # end
    parents[x]
  end

  def union(x, y)
    root_x = find(x)
    root_y = find(y)

    return if root_x == root_y

    if sizes[root_x] > sizes[root_y]
      parents[root_y] = root_x
      sizes[root_x] += sizes[root_y]
    else
      parents[root_x] = root_y
      sizes[root_y] += sizes[root_x]
    end

    @count -= 1
  end
end
# @lc code=end

puts find_circle_num([[1,1,0],[1,1,0],[0,0,1]])
puts find_circle_num([[1,0,0,1],[0,1,1,0],[0,1,1,1],[1,0,1,1]])
