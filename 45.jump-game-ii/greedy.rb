#
# @lc app=leetcode id=45 lang=ruby
#
# [45] Jump Game II
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def jump(nums)
  return 0 if nums.size == 1

  current_step_max_position = 0
  next_step_max_position = 0
  steps = 0

  (0..nums.size-2).each do |i|
    # Keep looking for max postion that next step can reach.
    next_step_max_position = nums[i] + i > next_step_max_position ? nums[i] + i : next_step_max_position

    # Start next step.
    if current_step_max_position == i
      current_step_max_position = next_step_max_position
      steps += 1
    end
  end

  steps
end
# @lc code=end

