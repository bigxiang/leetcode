#
# @lc app=leetcode id=33 lang=ruby
#
# [33] Search in Rotated Sorted Array
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  lo = 0
  hi = nums.size - 1

  while lo <= hi
    mid = lo + (hi - lo) / 2

    if nums[mid] == target
      return mid
    elsif nums[lo] == target
      return lo
    elsif nums[hi] == target
      return hi
    elsif nums[mid] >= nums[0]
      if nums[mid] > target && target > nums[0]
        hi = mid - 1
      else
        lo = mid + 1
      end
    elsif nums[mid] < nums[0]
      if nums[mid] < target && target < nums[hi]
        lo = mid + 1
      else
        hi = mid - 1
      end
    end
  end

  -1
end
# @lc code=end

