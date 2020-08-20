#
# @lc app=leetcode id=541 lang=ruby
#
# [541] Reverse String II
#

# @lc code=start
# @param {String} s
# @param {Integer} k
# @return {String}
def reverse_str(s, k)
  i = 0
  while i <= s.size - 1
    reverse_k_str(s, i, k)
    i += 2 * k
  end
  s
end

def reverse_k_str(s, i, k)
  j = [i+k-1, s.size-1].min
  while i <= j
    s[i], s[j] = s[j], s[i]
    i += 1
    j -= 1
  end
end
# @lc code=end

