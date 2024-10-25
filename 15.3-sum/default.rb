#
# @lc app=leetcode id=15 lang=ruby
#
# [15] 3Sum
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  nums = nums.sort
  result = []

  nums.each_with_index do |n, i|
    next if i > 0 && n == nums[i - 1]

    two_sum(nums, i, 0 - n, result)
  end

  result
end

def two_sum(nums, i, target, result)
  lo = i + 1
  hi = nums.size - 1

  while lo < hi
    if (lo > i + 1 && nums[lo] == nums[lo - 1]) || nums[lo] + nums[hi] < target
      lo += 1
    elsif (hi < nums.size - 1 && nums[hi] == nums[hi + 1]) || nums[lo] + nums[hi] > target
      hi -= 1
    else
      result << [nums[i], nums[lo], nums[hi]]
      lo += 1
    end
  end
end
# @lc code=end
