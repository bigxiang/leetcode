#
# @lc app=leetcode id=53 lang=ruby
#
# [53] Maximum Subarray
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  max = -2147483648
  current_max = 0

  nums.each do |n|
    current_max = current_max + n > n ? current_max + n : n
    max = current_max > max ? current_max : max
  end

  max
end
# @lc code=end

