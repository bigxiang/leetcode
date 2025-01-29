#
# @lc app=leetcode id=300 lang=ruby
#
# [300] Longest Increasing Subsequence
#

# @lc code=start
# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
  dp = []

  nums.each do |num|
    insert_to_dp(dp, num)
  end

  dp.size
end

def insert_to_dp(dp, num)
  dp.push(num) && return if dp.empty? || num > dp.last

  left = 0
  right = dp.size - 1
  while left < right
    mid = left + ((right - left) >> 1)
    return if dp[mid] == num

    if dp[mid] < num
      left = mid + 1
    else
      right = mid
    end
  end

  dp[left] = num
end
# @lc code=end

# @lcpr case=start
# [10,9,2,5,3,7,101,18]\n
# @lcpr case=end

# @lcpr case=start
# [0,1,0,3,2,3]\n
# @lcpr case=end

# @lcpr case=start
# [7,7,7,7,7,7,7]\n
# @lcpr case=end

# @lcpr case=start
# [5]\n
# @lcpr case=end

# @lcpr case=start
# [5,-2,3,-4,-3,1,6,7,6,3,2,0,4,2,6,3,8]\n
# @lcpr case=end
