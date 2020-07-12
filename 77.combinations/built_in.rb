#
# @lc app=leetcode id=77 lang=ruby
#
# [77] Combinations
#

# @lc code=start
# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}
def combine(n, k)
  (1..n).to_a.combination(k).to_a
end
# @lc code=end

