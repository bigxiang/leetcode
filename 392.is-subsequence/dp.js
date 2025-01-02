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

  const dp = new Array(t.length + 1).fill(0).map(() => new Array(26).fill(-1));
  let next;
  for (let i = t.length - 1; i >= 0; i--) {
    for (let j = 0; j < 26; j++) {
      dp[i][j] = dp[i + 1][j];
      next = t.charCodeAt(i) - 'a'.charCodeAt(0);
      if (next === j) dp[i][j] = i + 1;
    }
  }

  let pos = 0;
  for (let i = 0; i < s.length; i++) {
    next = s.charCodeAt(i) - 'a'.charCodeAt(0);
    if (dp[pos][next] === -1) return false;
    pos = dp[pos][next];
  }

  return true;
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
