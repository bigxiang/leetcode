#
# @lc app=leetcode.cn id=132 lang=ruby
#
# [132] 分割回文串 II
#

# @lc code=start
# @param {String} s
# @return {Integer}
def min_cut(s)
  palindromes = Array.new(s.length) { Array.new(s.length) { true } }
  (s.length-2).downto(0).each do |i|
    (i+1..s.length-1).each do |j|
      palindromes[i][j] = palindromes[i+1][j-1] && s[i] == s[j]
    end
  end

  dp = (0..s.length-1).to_a

  (1...s.length).each do |i|
    if palindromes[0][i]
      dp[i] = 0 
    else
      (1..i).each do |j|
        if palindromes[j][i]
          count = dp[j-1] + 1
          dp[i] = count if dp[i] > count
        end
      end
    end
  end

  dp[-1]
end
# @lc code=end