#
# @lc app=leetcode id=120 lang=ruby
#
# [120] Triangle
#

# @lc code=start
# @param {Integer[][]} triangle
# @return {Integer}
def minimum_total(triangle)
  (1..triangle.size-1).each do |i|
    (0..triangle[i].size-1).each do |j|
      if j == 0
        triangle[i][j] += triangle[i-1][j]
      elsif j == triangle[i].size-1
        triangle[i][j] += triangle[i-1][j-1]
      else
        min_last_row = triangle[i-1][j-1] > triangle[i-1][j] ? triangle[i-1][j] : triangle[i-1][j-1]
        triangle[i][j] += min_last_row
      end
    end
  end

  triangle.last.min
end
# @lc code=end

