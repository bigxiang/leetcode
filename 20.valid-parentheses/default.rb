#
# @lc app=leetcode id=20 lang=ruby
#
# [20] Valid Parentheses
#

# @lc code=start
# @param {String} s
# @return {Boolean}
def is_valid(s)
  pairs = {
    '}' => '{',
    ']' => '[',
    ')' => '('
  }

  stack = []

  s.chars.each do |c|
    if pairs.values.include?(c)
      stack << c
    else
      next if stack.pop == pairs[c]
      return false
    end
  end

  stack.empty?
end
# @lc code=end

