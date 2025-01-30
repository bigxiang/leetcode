#
# @lc app=leetcode.cn id=13 lang=ruby
# @lcpr version=30204
#
# [13] 罗马数字转整数
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} s
# @return {Integer}
def roman_to_int(s)
  map = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }
  num = 0
  s.chars.each_with_index do |c, i|
    if i < s.length - 1 && map[s[i]] < map[s[i + 1]]
      num -= map[s[i]]
    else
      num += map[s[i]]
    end
  end
  num
end
# @lc code=end

#
# @lcpr case=start
# "III"\n
# @lcpr case=end

# @lcpr case=start
# "IV"\n
# @lcpr case=end

# @lcpr case=start
# "IX"\n
# @lcpr case=end

# @lcpr case=start
# "LVIII"\n
# @lcpr case=end

# @lcpr case=start
# "MCMXCIV"\n
# @lcpr case=end

#
