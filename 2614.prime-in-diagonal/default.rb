#
# @lc app=leetcode.cn id=2614 lang=ruby
# @lcpr version=30204
#
# [2614] 对角线上的质数
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[][]} nums
# @return {Integer}
def diagonal_prime(nums)
  max = 0
  (0...nums.length).each do |i|
    max = [max, nums[i][i]].max if prime?(nums[i][i])
    max = [max, nums[i][nums.length - 1 - i]].max if prime?(nums[i][nums.length - 1 - i])
  end
  max
end

def prime?(num)
  return false if num < 2
  return true if num < 4

  (2..Math.sqrt(num).to_i).each do |i|
    return false if num % i == 0
  end

  true
end
# @lc code=end



#
# @lcpr case=start
# [[1,2,3],[5,6,7],[9,10,11]]\n
# @lcpr case=end

# @lcpr case=start
# [[1,2,3],[5,17,7],[9,11,10]]\n
# @lcpr case=end

#

