#
# @lc app=leetcode id=917 lang=ruby
#
# [917] Reverse Only Letters
#

# @lc code=start
# @param {String} s
# @return {String}
def reverse_only_letters(s)
  lo = 0
  hi = s.length - 1
  while lo < hi
    while lo < hi && !letter?(s[lo]); lo += 1; end
    while lo < hi && !letter?(s[hi]); hi -= 1; end

    s[lo], s[hi] = s[hi], s[lo]
    lo += 1
    hi -= 1
  end
  s
end

def letter?(c)
  c >= 'A' && c <= 'Z' || c >= 'a' && c <= 'z'
end
# @lc code=end

puts reverse_only_letters('ab-cd')
puts reverse_only_letters('7_28]')
