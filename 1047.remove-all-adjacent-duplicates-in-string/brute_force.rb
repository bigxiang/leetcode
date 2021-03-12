#
# @lc app=leetcode.cn id=1047 lang=ruby
#
# [1047] 删除字符串中的所有相邻重复项
#

# @lc code=start
# @param {String} s
# @return {String}
def remove_duplicates(s)
  keep_indexes = (0...s.length).each_with_object({}) { |i, memo| memo[i] = true }
  found = false
  (1...s.length).each do |i|
    next if s[i] != s[i-1]

    keep_indexes.delete(i)
    found = true
  end

  result = keep_indexes.keys.map { |i| s[i] }.join

  return result if !found

  remove_duplicates(result)
end
# @lc code=end

