#
# @lc app=leetcode id=239 lang=ruby
#
# [239] Sliding Window Maximum
#

# @lc code=start
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
  return [] if nums.size == 0 || k == 0
  return nums if k == 1

  window = []
  result = []

  (0..k-1).each do |i|
    append_to_window(nums, i, window)
  end

  (0..nums.size-k).each do |i|
    if i > 0
      window.shift if window.first < i
      append_to_window(nums, i+k-1, window)
    end

    result << nums[window.first]
  end

  result
end

def append_to_window(nums, i, window)
  while window.any? && nums[i] > nums[window[-1]]
    window.pop
  end

  window << i
end
# @lc code=end

