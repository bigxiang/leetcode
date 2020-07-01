#
# @lc app=leetcode id=718 lang=ruby
#
# [718] Maximum Length of Repeated Subarray
#

# @lc code=start
# @param {Integer[]} a
# @param {Integer[]} b
# @return {Integer}
def find_length(a, b)
  result = Array.new(a.size+1) { Array.new(b.size+1, 0) }
  max = 0

  (a.size-1).downto(0) do |i|
    (b.size-1).downto(0) do |j|
      if a[i] == b[j]
        result[i][j] = result[i+1][j+1] + 1
        max = result[i][j] > max ? result[i][j] : max
      else
        result[i][j] = 0
      end
    end
  end

  max
end

# @lc code=end

