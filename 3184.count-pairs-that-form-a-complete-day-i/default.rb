#
# @lc app=leetcode.cn id=3184 lang=ruby
# @lcpr version=30204
#
# [3184] 构成整天的下标对数目 I
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Integer[]} hours
# @return {Integer}
def count_complete_day_pairs(hours)
  count = 0
  (0..hours.size - 2).each do |i|
    (i + 1..hours.size - 1).each do |j|
      count += 1 if (hours[i] + hours[j]) % 24 == 0
    end
  end
  count
end
# @lc code=end

#
# @lcpr case=start
# [12,12,30,24,24]\n
# @lcpr case=end

# @lcpr case=start
# [72,48,24,3]\n
# @lcpr case=end

#
