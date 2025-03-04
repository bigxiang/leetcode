#
# @lc app=leetcode.cn id=132 lang=ruby
# @lcpr version=30204
#
# [132] 分割回文串 II
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} s
# @return {Integer}
def min_cut(s)
  palindromes = Array.new(s.length) { Array.new(s.length, false) }

  (1..s.length).each do |len|
    (0..s.length - len).each do |i|
      j = i + len - 1
      if i == j
        palindromes[i][j] = true
      elsif i + 1 == j
        palindromes[i][j] = s[i] == s[j]
      else
        palindromes[i][j] = s[i] == s[j] && palindromes[i + 1][j - 1]
      end
    end
  end

  dp = Array.new(s.length, Float::INFINITY)
  (0...s.length).each do |j|
    if palindromes[0][j]
      dp[j] = 0
    else
      dp[j] = (1..j).map { |i| palindromes[i][j] ? dp[i - 1] + 1 : Float::INFINITY }.min
    end
  end

  dp[-1]
end
# @lc code=end



#
# @lcpr case=start
# "aab"\n
# @lcpr case=end

# @lcpr case=start
# "a"\n
# @lcpr case=end

# @lcpr case=start
# "ab"\n
# @lcpr case=end

# @lcpr case=start
# "abcddbaeefgfkkkabaaca"\n
# @lcpr case=end


# @lcpr case=start
# "adabdcaebdcebdcacaaaadbbcadabcbeabaadcbcaaddebdbddcbdacdbbaedbdaaecabdceddccbdeeddccdaabbabbdedaaabcdadbdabeacbeadbaddcbaacdbabcccbaceedbcccedbeecbccaecadccbdbdccbcbaacccbddcccbaedbacdbcaccdcaadcbaebebcceabbdcdeaabdbabadeaaaaedbdbcebcbddebccacacddebecabccbbdcbecbaeedcdacdcbdbebbacddddaabaedabbaaabaddcdaadcccdeebcabacdadbaacdccbeceddeebbbdbaaaaabaeecccaebdeabddacbedededebdebabdbcbdcbadbeeceecdcdbbdcbdbeeebcdcabdeeacabdeaedebbcaacdadaecbccbededceceabdcabdeabbcdecdedadcaebaababeedcaacdbdacbccdbcece"\n
# @lcpr case=end

#

