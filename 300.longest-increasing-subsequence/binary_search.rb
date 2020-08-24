#
# @lc app=leetcode id=300 lang=ruby
#
# [300] Longest Increasing Subsequence
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
  return 0 if nums.empty?

  piles = []
  nums.each do |n|
    piles << n && next if piles.empty? || n > piles[-1]
    piles[piles.bsearch_index { |x| x >= n }] = n
  end
  piles.size
end
# @lc code=end

