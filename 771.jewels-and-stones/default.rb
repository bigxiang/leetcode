#
# @lc app=leetcode id=771 lang=ruby
#
# [771] Jewels and Stones
#

# @lc code=start
# @param {String} j
# @param {String} s
# @return {Integer}
def num_jewels_in_stones(j, s)
  jewels_set = Set.new(j.chars)
  s.chars.reduce(0) do |memo, c|
    jewels_set.include?(c) ? memo + 1 : memo
  end
end
# @lc code=end

