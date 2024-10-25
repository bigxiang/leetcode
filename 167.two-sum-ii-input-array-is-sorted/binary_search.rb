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
    return [lo + 1, hi + 1] if nums[lo] + nums[hi] == target

    mid = lo + (hi - lo) / 2

    if nums[lo] + nums[mid] >= target
      hi = mid
    elsif nums[mid] + nums[hi] <= target
      lo = mid
    elsif nums[lo] + nums[hi] < target
      lo += 1
    else
      hi -= 1
    end
  end
end
# @lc code=end
