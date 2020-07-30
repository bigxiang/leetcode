#
# @lc app=leetcode id=120 lang=ruby
#
# [120] Triangle
#

# @lc code=start
# @param {Integer[][]} triangle
# @return {Integer}
def minimum_total(triangle)
  (triangle.size-1).downto(1) do |i|
    (0..triangle[i].size-2).each do |j|
      triangle[i-1][j] += [triangle[i][j], triangle[i][j+1]].min
    end
  end

  triangle[0][0]
end
# @lc code=end

