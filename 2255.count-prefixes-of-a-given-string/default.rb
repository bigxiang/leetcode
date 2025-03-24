#
# @lc app=leetcode.cn id=2255 lang=ruby
# @lcpr version=30204
#
# [2255] 统计是给定字符串前缀的字符串数目
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String[]} words
# @param {String} s
# @return {Integer}
def count_prefixes(words, s)
  words.reduce(0) do |count, word|
    count += 1 if s.start_with?(word)
    count
  end
end
# @lc code=end



#
# @lcpr case=start
# ["a","b","c","ab","bc","abc"]\n"abc"\n
# @lcpr case=end

# @lcpr case=start
# ["a","a"]\n"aa"\n
# @lcpr case=end

# @lcpr case=start
# ["b"]\n"aa"\n
# @lcpr case=end

#

