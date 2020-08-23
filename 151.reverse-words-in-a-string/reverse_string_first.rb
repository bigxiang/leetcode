#
# @lc app=leetcode id=151 lang=ruby
#
# [151] Reverse Words in a String
#

# @lc code=start
# @param {String} s
# @return {String}
def reverse_words(s)
  s.strip.reverse.split(' ').map(&:reverse).join(' ')
end
# @lc code=end

