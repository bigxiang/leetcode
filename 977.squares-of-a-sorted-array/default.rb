#
# @lc app=leetcode.cn id=977 lang=ruby
# @lcpr version=30204
#
# [977] 有序数组的平方
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @return {Integer[]}
def sorted_squares(nums)
  return nums.map { |num| num * num } if nums.size == 1

  min_index = 0
  (1..nums.size - 1).each do |i|
    break unless nums[i].abs <= nums[i - 1].abs

    min_index = i
  end

  result = [nums[min_index]**2]
  left = min_index - 1
  right = min_index + 1
  while left >= 0 || right < nums.size
    if left < 0
      result << nums[right]**2
      right += 1
    elsif right >= nums.size
      result << nums[left]**2
      left -= 1
    elsif nums[left].abs < nums[right].abs
      result << nums[left]**2
      left -= 1
    else
      result << nums[right]**2
      right += 1
    end
  end

  result
end
# @lc code=end

#
# @lcpr case=start
# [-4,-1,0,3,10]\n
# @lcpr case=end

# @lcpr case=start
# [-7,-3,2,3,11]\n
# @lcpr case=end

# @lcpr case=start
# [-7,-3]\n
# @lcpr case=end

# @lcpr case=start
# [2]\n
# @lcpr case=end

# @lcpr case=start
# [-100,-88,-70,-65,-14,-7,2,8,15,22,34,67,89]\n
# @lcpr case=end

# @lcpr case=start
# [-4,-4,-3]\n
# @lcpr case=end

#
