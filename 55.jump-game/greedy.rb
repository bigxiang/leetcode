#
# @lc app=leetcode id=55 lang=ruby
#
# [55] Jump Game
#

# @lc code=start
# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  last_possible_position = nums.size - 1

  (nums.size-1).downto(0) do |i|
    last_possible_position = i if i + nums[i] >= last_possible_position
  end

  last_possible_position == 0
end
# @lc code=end

