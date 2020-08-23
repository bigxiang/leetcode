#
# @lc app=leetcode id=14 lang=ruby
#
# [14] Longest Common Prefix
#

# @lc code=start
# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return '' if strs.empty?
  return strs[0] if strs.size == 1

  (0..strs[0].length-1).each do |i|
    c = strs[0][i]
    (1..strs.size-1).each do |j|
      return strs[0][0...i] if strs[j][i] != c
    end
  end

  strs[0]
end
# @lc code=end

