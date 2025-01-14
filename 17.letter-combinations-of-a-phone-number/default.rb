#
# @lc app=leetcode.cn id=17 lang=ruby
# @lcpr version=30204
#
# [17] 电话号码的字母组合
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  digits_map = {
    '2' => 'abc',
    '3' => 'def',
    '4' => 'ghi',
    '5' => 'jkl',
    '6' => 'mno',
    '7' => 'pqrs',
    '8' => 'tuv',
    '9' => 'wxyz'
  }

  return [] if digits.empty?

  result = []
  dfs(digits, 0, '', result, digits_map)
  result
end

def dfs(digits, i, path, result, digits_map)
  if i == digits.size
    result << path
    return
  end

  digits_map[digits[i]].each_char do |c|
    dfs(digits, i + 1, path + c, result, digits_map)
  end
end
# @lc code=end

#
# @lcpr case=start
# "23"\n
# @lcpr case=end

# @lcpr case=start
# ""\n
# @lcpr case=end

# @lcpr case=start
# "2"\n
# @lcpr case=end

#
