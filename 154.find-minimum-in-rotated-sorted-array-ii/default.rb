#
# @lc app=leetcode id=154 lang=ruby
#
# [154] Find Minimum in Rotated Sorted Array II
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  lo = 0
  hi = nums.size - 1

  while lo < hi
    mid = lo + (hi - lo) / 2

    if nums[mid] < nums[hi]
      hi = mid
    elsif nums[mid] > nums[hi]
      lo = mid + 1
    else
      hi -= 1
    end
  end

  nums[lo]
end
# @lc code=end


# puts find_min([4,5,6,7,0,1,2])
# puts find_min([1])
# puts find_min([1,3,5])
# puts find_min([2,2,2,0,1])
# puts find_min([1,2,0,1,1,1,1])
# puts find_min([1,1,1,1,2,0,1,1])
# puts find_min([1,1])
# puts find_min([10,1,10,10,10])
