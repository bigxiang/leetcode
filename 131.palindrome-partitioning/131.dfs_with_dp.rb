#
# @lc app=leetcode.cn id=131 lang=ruby
#
# [131] 分割回文串
#

# @lc code=start
# @param {String} s
# @return {String[][]}
def partition(s)
  result = []
  
  palindromes = Array.new(s.length) { Array.new(s.length) { true } }

  (s.length-2).downto(0).each do |i|
    (i+1...s.length).each do |j|
      palindromes[i][j] = palindromes[i+1][j-1] && s[i] == s[j]
    end
  end

  dfs(s, 0, result, [], palindromes)

  result
end

def dfs(s, start, result, substrings, palindromes)
  return result << substrings if start == s.length

  (start...s.length).each do |j|
    if palindromes[start][j]
      substrings << s[start..j]
      dfs(s, j+1, result, substrings, palindromes)
      substrings.pop
    end
  end
end
# @lc code=end

