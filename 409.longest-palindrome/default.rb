#
# @lc app=leetcode.cn id=409 lang=ruby
# @lcpr version=30204
#
# [409] 最长回文串
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} s
# @return {Integer}
def longest_palindrome(s)
  result = 0
  chars_map = s.chars.each_with_object({}) do |char, map|
    map[char] ||= 0
    map[char] += 1
  end
  chars_map.each do |_, count|
    result += count / 2 * 2
    result += 1 if count % 2 == 1 && result % 2 == 0
  end
  result
end
# @lc code=end



#
# @lcpr case=start
# "abccccdd"\n
# @lcpr case=end

# @lcpr case=start
# "a"\n
# @lcpr case=end

#

