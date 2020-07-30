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
  return 0 if text1.nil? || text2.nil?
  return 0 if text1.length == 0 || text2.length == 0

  dp = Array.new(text1.size + 1) { Array.new(text2.size + 1, 0) }

  (1..text1.size).each do |i|
    (1..text2.size).each do |j|
      dp[i][j] = text1[i-1] == text2[j-1] ? dp[i-1][j-1] + 1 : [dp[i-1][j], dp[i][j-1]].max
    end
  end

  dp[-1][-1]
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
