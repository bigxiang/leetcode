#
# @lc app=leetcode.cn id=16 lang=ruby
# @lcpr version=30204
#
# [16] 最接近的三数之和
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
  return nums.sum if nums.length <= 3

  nums.sort!

  closest = -Float::INFINITY
  (0..nums.length - 3).each do |i|
    next if i > 0 && nums[i] == nums[i - 1]

    sum = nums[i] + two_sum_closest(nums, target - nums[i], i + 1)
    closest = sum if (sum - target).abs < (closest - target).abs
  end
  closest
end

def two_sum_closest(nums, target, start)
  left = start
  right = nums.length - 1

  closest = -Float::INFINITY
  while left < right
    sum = nums[left] + nums[right]

    if sum == target
      return target
    elsif sum < target
      left += 1
    else
      right -= 1
    end

    closest = sum if (sum - target).abs < (closest - target).abs
  end
  closest
end
# @lc code=end

#
# @lcpr case=start
# [-1,2,1,-4]\n1\n
# @lcpr case=end

# @lcpr case=start
# [0,0,0]\n1\n
# @lcpr case=end

#
