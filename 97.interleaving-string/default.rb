#
# @lc app=leetcode id=97 lang=ruby
#
# [97] Interleaving String
#

# @lc code=start
# @param {String} s1
# @param {String} s2
# @param {String} s3
# @return {Boolean}
def is_interleave(s1, s2, s3)
  return false if s1.size + s2.size != s3.size

  memo = Array.new(s1.size + 1) { Array.new(s2.size + 1, nil) }
  interleave(s1, 0, s2, 0, s3, 0, memo)
end

def interleave(s1, s1_index, s2, s2_index, s3, s3_index, memo)
  if s1_index == s1.size
    s3[s3_index..-1] == s2[s2_index..-1]
  elsif s2_index == s2.size
    s3[s3_index..-1] == s1[s1_index..-1]
  else
    return memo[s1_index][s2_index] unless memo[s1_index][s2_index].nil?

    result = s1[s1_index] == s3[s3_index] && interleave(s1, s1_index + 1, s2, s2_index, s3, s3_index + 1, memo) ||
      s2[s2_index] == s3[s3_index] && interleave(s1, s1_index, s2, s2_index + 1, s3, s3_index + 1, memo)

    memo[s1_index][s2_index] = result
  end
end
# @lc code=end




