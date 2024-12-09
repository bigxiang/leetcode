/*
 * @lc app=leetcode.cn id=392 lang=javascript
 * @lcpr version=30204
 *
 * [392] 判断子序列
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} s
 * @param {string} t
 * @return {boolean}
 */
var isSubsequence = function(s, t) {
  if (s.length === 0) return true;

  let sIndex = 0, tIndex = 0;
  while (tIndex < t.length) {
    if (s[sIndex] === t[tIndex]) {
      sIndex++;
      if (sIndex === s.length) return true;
    }
    tIndex++;
  }
  return false;
};
// @lc code=end



// @lcpr case=start
// "abc"\n"ahbgdc"\n
// @lcpr case=end

// @lcpr case=start
// "axc"\n"ahbgdc"\n
// @lcpr case=end

// @lcpr case=start
// ""\n"ahbgdc"\n
// @lcpr case=end

// @lcpr case=start
// "a"\n""\n
// @lcpr case=end

// @lcpr case=start
// ""\n""\n
// @lcpr case=end
