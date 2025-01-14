#
# @lc app=leetcode id=31 lang=ruby
#
# [31] Next Permutation
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def next_permutation(nums)
  return if nums.length == 1

  points = find_switch_points(nums)
  return reverse(nums, 0) if points.empty?

  nums[points[0]], nums[points[1]] = nums[points[1]], nums[points[0]]
  reverse(nums, points[0] + 1)
end

def find_switch_points(nums)
  left = nil
  (nums.size - 2).downto(0) do |i|
    if nums[i] < nums[i + 1]
      left = i
      break
    end
  end
  return [] if left.nil?

  right = nil
  min = Float::INFINITY
  (left + 1...nums.size).each do |i|
    next if nums[i] <= nums[left]

    if nums[i] <= min
      min = nums[i]
      right = i
    end
  end

  [left, right]
end

def reverse(nums, start_point)
  left = start_point
  right = nums.size - 1
  while left < right
    nums[left], nums[right] = nums[right], nums[left]
    left += 1
    right -= 1
  end
end
# @lc code=end

#
# @lcpr case=start
# [3,2,1]\n
# @lcpr case=end

# @lcpr case=start
# [2]\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3]\n
# @lcpr case=end

# @lcpr case=start
# [1,3,2,4,5]\n
# @lcpr case=end

# @lcpr case=start
# [2,3,5,4,1]\n
# @lcpr case=end

# @lcpr case=start
# [2,3,1,3,3]\n
# @lcpr case=end
#
