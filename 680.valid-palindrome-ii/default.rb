#
# @lc app=leetcode id=680 lang=ruby
#
# [680] Valid Palindrome II
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} s
# @return {Boolean}
def valid_palindrome(s)
  palindrome(s, 0, s.length - 1, false)
end

def palindrome(s, left, right, removed)
  return true if left >= right

  if s[left] == s[right]
    palindrome(s, left + 1, right - 1, removed)
  elsif !removed
    palindrome(s, left + 1, right, true) || palindrome(s, left, right - 1, true)
  else
    false
  end
end

# @lc code=end

puts valid_palindrome('abca')
puts valid_palindrome('abcd')
puts valid_palindrome('abcbcca')
s = 'aguokepatgbnvfqmgmlcupuufxoohdfpgjdmysgvhmvffcnqxjjxqncffvmhvgsymdjgpfdhooxfuupuculmgmqfvnbgtapekouga'
puts valid_palindrome(s)
