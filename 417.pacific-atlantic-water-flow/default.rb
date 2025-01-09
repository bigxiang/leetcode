#
# @lc app=leetcode.cn id=417 lang=ruby
# @lcpr version=30204
#
# [417] 太平洋大西洋水流问题
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[][]} heights
# @return {Integer[][]}
def pacific_atlantic(heights)
  m = heights.size
  n = heights[0].size

  pacific = Array.new(m) { Array.new(n, false) }
  atlantic = Array.new(m) { Array.new(n, false) }

  (0...m).each do |i|
    dfs(heights, pacific, i, 0)
    dfs(heights, atlantic, i, n - 1)
  end

  (0...n).each do |j|
    dfs(heights, pacific, 0, j)
    dfs(heights, atlantic, m - 1, j)
  end

  result = []
  (0...m).each do |i|
    (0...n).each do |j|
      result << [i, j] if pacific[i][j] && atlantic[i][j]
    end
  end

  result
end

def dfs(heights, ocean, i, j)
  return if ocean[i][j]

  ocean[i][j] = true

  [[0, 1], [0, -1], [1, 0], [-1, 0]].each do |di, dj|
    next_i = i + di
    next_j = j + dj
    next unless next_i >= 0 && next_i < heights.size &&
                next_j >= 0 && next_j < heights[0].size &&
                heights[next_i][next_j] >= heights[i][j]

    dfs(heights, ocean, next_i, next_j)
  end
end

# @lc code=end

#
# @lcpr case=start
# [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]\n
# @lcpr case=end

# @lcpr case=start
# [[2,1],[1,2]]\n
# @lcpr case=end

# @lcpr case=start
# [[2]]\n
# @lcpr case=end

# @lcpr case=start
# [[1,2,3],[8,9,4],[7,6,5]]\n
# @lcpr case=end

#
