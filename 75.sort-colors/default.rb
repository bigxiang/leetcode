#
# @lc app=leetcode id=75 lang=ruby
#
# [75] Sort Colors
#

# @lc code=start
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
  i = 0
  zero_pos = 0
  two_pos = nums.size - 1
  while i <= two_pos
    case nums[i]
    when 0
      nums[i], nums[zero_pos] = nums[zero_pos], nums[i]
      zero_pos += 1
      i += 1
    when 2
      nums[i], nums[two_pos] = nums[two_pos], nums[i]
      two_pos -= 1
    else
      i += 1
    end
  end
end
# @lc code=end

