#
# @lc app=leetcode id=438 lang=ruby
#
# [438] Find All Anagrams in a String
#

# @lc code=start
# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
  return [] if s.nil? || s.length < p.length

  left = 0
  right = 0
  result = []

  p_count = p.chars.each_with_object(Hash.new(0)) do |c, h|
    h[c] += 1
  end

  while right < s.length
    p_count[s[right]] -= 1
    result << left if p_count.all? { |_, v| v == 0 }

    if right - left == p.length - 1
      p_count[s[left]] += 1
      left += 1
    end

    right += 1
  end

  result
end
# @lc code=end

