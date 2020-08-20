#
# @lc app=leetcode id=58 lang=ruby
#
# [58] Length of Last Word
#

# @lc code=start
# @param {String} s
# @return {Integer}
def length_of_last_word(s)
  count = 0
  i = s.size - 1
  while i >= 0
    if s[i] == ' '
      return count if count != 0
    else
      count += 1
    end
    i -= 1
  end
  count
end
# @lc code=end

