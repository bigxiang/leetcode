#
# @lc app=leetcode.cn id=1047 lang=ruby
#
# [1047] 删除字符串中的所有相邻重复项
#

# @lc code=start
# @param {String} s
# @return {String}
def remove_duplicates(s)
  result = []
  s.chars.each do |c|
    if result.last != c
      result << c
    else
      result.pop
    end
  end

  result
end
# @lc code=end