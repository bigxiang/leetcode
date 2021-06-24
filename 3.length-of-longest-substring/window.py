#
# @lc app=leetcode.cn id=3 lang=python3
#
# [3] 无重复字符的最长子串
#

# @lc code=start
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        start = -1
        substr = {}
        result = 0
        for i, l in enumerate(s):
            if l in substr and substr[l] > start:
                start = substr[l]
                
            substr[l] = i
            result = max(result, i - start)
             
        return result

# @lc code=end

