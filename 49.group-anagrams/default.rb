#
# @lc app=leetcode id=49 lang=ruby
#
# [49] Group Anagrams
#

# @lc code=start
# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  grouped_map = strs.each_with_object({}) do |str, memo|
    sorted_str = str.chars.sort.join
    memo[sorted_str] ||= []
    memo[sorted_str] << str
  end

  grouped_map.values
end
# @lc code=end

