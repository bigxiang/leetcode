#
# @lc app=leetcode id=169 lang=ruby
#
# [169] Majority Element
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  dac(nums, 0, nums.size - 1)
end

def dac(nums, lo, hi)
  return nums[lo] if lo == hi

  mi = lo + (hi - lo) / 2
  left_majority_num = dac(nums, lo, mi)
  right_majority_num = dac(nums, mi + 1, hi)

  return left_majority_num if left_majority_num == right_majority_num

  left_majority_num_count = 0
  right_majority_num_count = 0
  (lo..hi).each do |i|
    left_majority_num_count += 1 if nums[i] == left_majority_num
    right_majority_num_count += 1 if nums[i] == right_majority_num
  end

  left_majority_num_count > right_majority_num_count ? left_majority_num : right_majority_num
end
# @lc code=end

