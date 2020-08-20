#
# @lc app=leetcode id=709 lang=ruby
#
# [709] To Lower Case
#

# @lc code=start
# @param {String} str
# @return {String}
def to_lower_case(str)
  (0..str.length-1).each do |i|
    if str[i] >= 'A' && str[i] <= 'Z'
      str[i] = (str[i].ord + 32).chr
    end
  end
  str
end
# @lc code=end

