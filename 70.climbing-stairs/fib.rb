#
# @lc app=leetcode id=70 lang=ruby
#
# [70] Climbing Stairs
#

# @lc code=start
# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  n_1 = 0
  n_2 = 1
  (1..n).each do |i|
    n_1, n_2 = n_2, n_1 + n_2
  end
  n_2
end
# @lc code=end

