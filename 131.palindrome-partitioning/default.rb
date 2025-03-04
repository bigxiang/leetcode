#
# @lc app=leetcode.cn id=131 lang=ruby
# @lcpr version=30204
#
# [131] 分割回文串
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} s
# @return {String[][]}
def partition(s)
  result = []
  palindromes = calculate_palindrome(s)

  dfs(s, 0, [], result, palindromes)
  result
end

def calculate_palindrome(s)
  dp = Array.new(s.length) { Array.new(s.length, false) }
  (1..s.length).each do |len|
    (0..s.length - len).each do |i|
      j = i + len - 1
      if i == j
        dp[i][j] = true
      elsif i + 1 == j
        dp[i][j] = s[i] == s[j]
      else
        dp[i][j] = s[i] == s[j] && dp[i + 1][j - 1]
      end
    end
  end
  dp
end

def dfs(s, i, path, result, palindromes)
  if i == s.length
    result << path
    return
  end

  (i...s.length).each do |j|
    next unless palindromes[i][j]

    dfs(s, j + 1, path + [s[i..j]], result, palindromes)
  end
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
# "abababababab"\n
# @lcpr case=end
#

