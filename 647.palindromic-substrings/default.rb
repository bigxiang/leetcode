#
# @lc app=leetcode id=647 lang=ruby
#
# [647] Palindromic Substrings
#

# @lc code=start
# @param {String} s
# @return {Integer}
def count_substrings(s)
  l = s.length
  result = 0

  (0..2*l-2).each do |center|
    left = center / 2
    right = left + center % 2

    while left >= 0 && right <= l-1 && s[left] == s[right]
      result += 1
      left -= 1
      right += 1
    end
  end

  result
end
# @lc code=end

puts count_substrings('aaaaa')
