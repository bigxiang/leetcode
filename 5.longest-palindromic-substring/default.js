/*
 * @lc app=leetcode.cn id=5 lang=javascript
 * @lcpr version=30204
 *
 * [5] 最长回文子串
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} s
 * @return {string}
 */
var longestPalindrome = function(s) {
  if (s.length < 2) return s;

  let start = 0, maxLength = 1;

  for (let i = 0; i < s.length; i++) {
    let left = i - 1;
    let right = i + 1;

    while (right < s.length && s[right] === s[i]) {
      right++;
    }

    while (left >= 0 && s[left] === s[i]) {
      left--;
    }

    while (left >= 0 && right < s.length && s[left] === s[right]) {
      left--;
      right++;
    }

    let length = right - left - 1;
    if (length > maxLength) {
      maxLength = length;
      start = left + 1;
    }
  }

  return s.substring(start, start + maxLength);
};
// @lc code=end

// @lcpr case=start
// "babad"\n
// @lcpr case=end

// @lcpr case=start
// "cbbd"\n
// @lcpr case=end

// @lcpr case=start
// "a"\n
// @lcpr case=end

// @lcpr case=start
// "12589ofjdlkajfhie82837y9odafhkcx"\n
// @lcpr case=end
