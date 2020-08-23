#
# @lc app=leetcode id=680 lang=ruby
#
# [680] Valid Palindrome II
#

# @lc code=start
# @param {String} s
# @return {Boolean}
def valid_palindrome(s)
  return true if palindrome?(s)

  lo = 0
  hi = s.length - 1

  while lo < hi
    if s[lo] == s[hi]
      lo += 1
      hi -= 1
    else
      return palindrome?(s[lo+1..hi]) || palindrome?(s[lo..hi-1])
    end
  end

  true
end

def palindrome?(s)
  s == s.reverse
end


# @lc code=end

puts valid_palindrome('abca')
puts valid_palindrome('abcd')
puts valid_palindrome('abcbcca')
s = 'aguokepatgbnvfqmgmlcupuufxoohdfpgjdmysgvhmvffcnqxjjxqncffvmhvgsymdjgpfdhooxfuupuculmgmqfvnbgtapekouga'
puts valid_palindrome(s)


