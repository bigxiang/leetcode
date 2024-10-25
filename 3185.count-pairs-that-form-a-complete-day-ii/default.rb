#
# @lc app=leetcode.cn id=3185 lang=ruby
# @lcpr version=30204
#
# [3185] 构成整天的下标对数目 II
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} hours
# @return {Integer}
def count_complete_day_pairs(hours)
  return 0 if hours.size == 1

  mods = Array.new(24, 0)
  hours.each do |hour|
    mods[hour % 24] += 1
  end
  result = mods[0] * (mods[0] - 1) / 2 + mods[12] * (mods[12] - 1) / 2
  (1..11).each do |i|
    result += mods[i] * mods[24 - i]
  end
  result
end
# @lc code=end

#
# @lcpr case=start
# [12,12,30,24,24]\n
# @lcpr case=end

# @lcpr case=start
# [72,48,24,3]\n
# @lcpr case=end

# @lcpr case=start
# [72]\n
# @lcpr case=end

# @lcpr case=start
# [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,72]\n
# @lcpr case=end

#
