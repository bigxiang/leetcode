#
# @lc app=leetcode id=392 lang=ruby
#
# [392] Is Subsequence
#

# @lc code=start
# @param {String} s
# @param {String} t
# @return {Boolean}
def is_subsequence(s, t)
  return true if s.empty?

  t_pos_maps = Array.new(t.size + 1) { {} }

  (t.size-1).downto(0).each do |i|
    t_pos_maps[i] = t_pos_maps[i+1].merge(t[i] => i)
  end

  t_pos_maps_index = 0
  s.chars.each do |c|
    if t_pos_maps[t_pos_maps_index].key?(c)
      t_pos_maps_index = t_pos_maps[t_pos_maps_index][c] + 1
    else
      return false
    end
  end

  true
end
# @lc code=end

puts is_subsequence('', 'ahbgdc')

puts is_subsequence(
  "abc",
  "ahbgdc"
)

puts is_subsequence(
  "axc",
  "ahbgdc"
)
