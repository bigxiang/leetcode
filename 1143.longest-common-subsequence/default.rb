#
# @lc app=leetcode id=1143 lang=ruby
#
# [1143] Longest Common Subsequence
#

# @lc code=start
# @param {String} text1
# @param {String} text2
# @return {Integer}
def longest_common_subsequence(text1, text2)
  memo = Array.new(text1.size) { Array.new(text2.size, -1) }
  helper(text1, text2, 0, 0, memo)
end

def helper(text1, text2, i, j, memo)
  return 0 if i == text1.size || j == text2.size
  return memo[i][j] if memo[i][j] > -1

  result =
    if text1[i] == text2[j]
      1 + helper(text1, text2, i+1, j+1, memo)
    else
      [
        helper(text1, text2, i+1, j, memo),
        helper(text1, text2, i, j+1, memo)
      ].max
    end

  memo[i][j] = result
  result
end
# @lc code=end

# puts longest_common_subsequence(
#   "czy",
#   "cbihkd"
# )

# puts longest_common_subsequence(
#   "abyrgzczy",
#   "cbgncrcbihkd"
# )

puts longest_common_subsequence(
  "pmjghexybyrgzczy",
  "hafcdqbgncrcbihkd"
)


puts longest_common_subsequence(
  "abcd",
  "bde"
)
