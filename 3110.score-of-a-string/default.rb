#
# @lc app=leetcode.cn id=3110 lang=ruby
# @lcpr version=30204
#
# [3110] 字符串的分数
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} s
# @return {Integer}
def score_of_string(s)
  score = 0
  (0...s.length - 1).each do |i|
    score += (s[i].ord - s[i + 1].ord).abs
  end

  score
end
# @lc code=end



#
# @lcpr case=start
# "hello"\n
# @lcpr case=end

# @lcpr case=start
# "zaz"\n
# @lcpr case=end

# @lcpr case=start
# "aa"\n
# @lcpr case=end

# @lcpr case=start
# "aabaccjlkdjfaosidfujadflsadjflksjaflkfjlkafsfalskkcxvhiudfytwe"\n
# @lcpr case=end

#

