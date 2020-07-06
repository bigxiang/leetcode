#
# @lc app=leetcode id=167 lang=ruby
#
# [167] Two Sum II Input Array Is Sorted
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  lo = 0
  hi = nums.size - 1
  while lo < hi
    if nums[lo] + nums[hi] < target
      lo += 1
    elsif nums[lo] + nums[hi] > target
      hi -= 1
    else
      return [lo+1, hi+1]
    end
  end
end
# @lc code=end

