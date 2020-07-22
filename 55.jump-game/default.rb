#
# @lc app=leetcode id=55 lang=ruby
#
# [55] Jump Game
#

# @lc code=start
# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  return true if nums.size == 1

  dp = Array.new(nums.size, false)
  dp[-1] = true

  (nums.size-2).downto(0) do |i|
    if i + nums[i] >= nums.size - 1
      dp[i] = true
      next
    else
      # This will exceed the time limit!!!
      (1..nums[i]).each do |step|
        if dp[i + step]
          dp[i] = true
          break
        end
      end
    end
  end

  dp[0]
end
# @lc code=end

