#
# @lc app=leetcode id=680 lang=ruby
#
# [680] Valid Palindrome II
#

# @lc code=start
# @param {String} s
# @return {Boolean}
def valid_palindrome(s)
  palindrome?(s, 0, s.length - 1, false)
end

def palindrome?(s, lo, hi, removed)
  return true if lo >= hi
  return true if s[lo] == s[hi] && palindrome?(s, lo+1, hi-1, removed)
  return false if removed
  palindrome?(s, lo+1, hi, true) || palindrome?(s, lo, hi-1, true)
end


# @lc code=end

puts valid_palindrome('abca')
puts valid_palindrome('abcd')
puts valid_palindrome('abcbcca')
s = 'aguokepatgbnvfqmgmlcupuufxoohdfpgjdmysgvhmvffcnqxjjxqncffvmhvgsymdjgpfdhooxfuupuculmgmqfvnbgtapekouga'
puts valid_palindrome(s)


