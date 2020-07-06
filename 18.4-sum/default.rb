#
# @lc app=leetcode id=18 lang=ruby
#
# [18] 4Sum
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
def four_sum(nums, target)
  nums = nums.sort

  k_sum(nums, 4, 0, target)
end

def k_sum(nums, k, start, target)
  result = []

  if k == 2
    result = two_sum(nums, start, target)
  else
    (start..nums.size-1).each do |i|
      next if i > start && nums[i] == nums[i - 1]

      k_sum(nums, k - 1, i + 1, target - nums[i]).each do |tmp_result|
        result << [nums[i]] + tmp_result
      end
    end
  end

  result
end

def two_sum(nums, start, target)
  result = []
  lo = start
  hi = nums.size - 1

  while lo < hi
    if lo > start && nums[lo] == nums[lo - 1] || nums[lo] + nums[hi] < target
      lo += 1
    elsif hi < nums.size - 1 && nums[hi] == nums[hi + 1] || nums[lo] + nums[hi] > target
      hi -= 1
    else
      result << [nums[lo], nums[hi]]
      lo += 1
    end
  end

  result
end
# @lc code=end

