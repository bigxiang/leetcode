#
# @lc app=leetcode.cn id=1328 lang=ruby
# @lcpr version=30204
#
# [1328] 破坏回文串
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} palindrome
# @return {String}
def break_palindrome(palindrome)
  length = palindrome.length
  return '' if length == 1

  (0...length / 2).each do |i|
    next if palindrome[i] == 'a'

    palindrome[i] = 'a'
    return palindrome
  end

  palindrome[-1] = 'b'
  palindrome
end
# @lc code=end



#
# @lcpr case=start
# "abccba"\n
# @lcpr case=end

# @lcpr case=start
# "a"\n
# @lcpr case=end

# @lcpr case=start
# "aaaaaa"\n
# @lcpr case=end

# @lcpr case=start
# "aba"\n
# @lcpr case=end

# @lcpr case=start
# "abba"\n
# @lcpr case=end

# @lcpr case=start
# "leetcodeedocteel"\n
# @lcpr case=end

#

