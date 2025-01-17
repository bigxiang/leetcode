#
# @lc app=leetcode id=20 lang=ruby
#
# [20] Valid Parentheses
#

# @lcpr-template-start

# @lcpr-template-end
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

  s.each_char do |c|
    stack.push(c) && next unless pairs.key?(c)

    return false if stack.pop != pairs[c]
  end

  stack.empty?
end
# @lc code=end

# @lcpr case=start
# "({[((()))[]]})"\n
# @lcpr case=end

# @lcpr case=start
# "(()]"\n
# @lcpr case=end

# @lcpr case=start
# "(){}[]"\n
# @lcpr case=end
