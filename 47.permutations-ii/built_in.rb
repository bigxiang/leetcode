#
# @lc app=leetcode id=47 lang=ruby
#
# [47] Permutations II
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def permute_unique(nums)
  nums.permutation.to_a.uniq
end
# @lc code=end

