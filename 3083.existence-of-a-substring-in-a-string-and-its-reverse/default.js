/*
 * @lc app=leetcode.cn id=3083 lang=javascript
 * @lcpr version=30204
 *
 * [3083] 字符串及其反转中是否存在同一子字符串
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} s
 * @return {boolean}
 */
var isSubstringPresent = function(s) {
  if (s.length === 1) return false;

  const pairSet = new Set();
  for (let i = 0; i < s.length - 1; i++) {
    if (s[i] === s[i+1]) return true;

    if (pairSet.has(s[i] + s[i+1])) return true;
    pairSet.add(s[i+1] + s[i]);
  }

  return false;
};
// @lc code=end



// @lcpr case=start
// "leetcode"\n
// @lcpr case=end

// @lcpr case=start
// "abcba"\n
// @lcpr case=end

// @lcpr case=start
// "abcd"\n
// @lcpr case=end

// @lcpr case=start
// "a"\n
// @lcpr case=end
