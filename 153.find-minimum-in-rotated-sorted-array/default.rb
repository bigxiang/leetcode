#
# @lc app=leetcode id=153 lang=ruby
#
# [153] Find Minimum in Rotated Sorted Array
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  return nums[0] if nums.size == 1
  return nums[0] if nums[0] < nums[-1]

  lo = 0
  hi = nums.size - 1
  while lo <= hi
    mid = lo + (hi - lo) / 2

    return nums[mid] if nums[mid] < nums[mid-1]
    return nums[mid+1] if nums[mid] > nums[mid+1]

    if nums[mid] > nums[lo]
      lo = mid + 1
    elsif nums[mid] < nums[lo]
      hi = mid - 1
    end
  end
end
# @lc code=end

