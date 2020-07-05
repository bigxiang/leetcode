#
# @lc app=leetcode id=49 lang=ruby
#
# [49] Group Anagrams
#

# @lc code=start
# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  a_ord = 'a'.ord
  grouped_map = strs.each_with_object({}) do |str, memo|
    char_count = Array.new(26, 0)
    str.chars.each do |c|
      char_count[c.ord - a_ord] += 1
    end
    char_count_str = char_count.join

    memo[char_count_str] ||= []
    memo[char_count_str] << str
  end

  grouped_map.values
end
# @lc code=end

