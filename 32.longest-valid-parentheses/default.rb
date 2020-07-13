#
# @lc app=leetcode id=32 lang=ruby
#
# [32] Longest Valid Parentheses
#

# @lc code=start
# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  result = 0
  dp = Array.new(s.size, 0)

  s.chars.each_with_index do |c, i|
    next if c != ')' || i-1 < 0

    if s[i-1] == '('
      dp[i] = i >= 2 ? dp[i-2] + 2 : 2
    else
      idx_of_last_valid_substring = i - dp[i-1]
      if idx_of_last_valid_substring > 0 && s[idx_of_last_valid_substring-1] == '('
        dp[i] = dp[i-1] + dp[idx_of_last_valid_substring-2] + 2
      end
    end

    result = [result, dp[i]].max
  end

  result
end
# @lc code=end

