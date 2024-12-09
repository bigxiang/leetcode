/*
 * @lc app=leetcode.cn id=3 lang=javascript
 * @lcpr version=30204
 *
 * [3] 无重复字符的最长子串
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} s
 * @return {number}
 */
var lengthOfLongestSubstring = function(s) {
  if (s.length === 0) return 0;

  let chars = new Map();
  let maxLength = 0;
  let left = 0;
  for (let right = 0; right < s.length; right++) {
    if (chars.has(s[right])) {
      left = Math.max(chars.get(s[right]) + 1, left);
    }
    chars.set(s[right], right);
    length = right - left + 1;
    maxLength = Math.max(maxLength, length);
  }
  return maxLength;
};
// @lc code=end



// @lcpr case=start
// "abcabcbb"\n
// @lcpr case=end

// @lcpr case=start
// "bbbbb"\n
// @lcpr case=end

// @lcpr case=start
// "pwwkew"\n
// @lcpr case=end

// @lcpr case=start
// ""\n
// @lcpr case=end

// @lcpr case=start
// "pwkkwnfzkew"\n
// @lcpr case=end


