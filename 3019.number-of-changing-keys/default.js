/*
 * @lc app=leetcode.cn id=3019 lang=javascript
 * @lcpr version=30204
 *
 * [3019] 按键变更的次数
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} s
 * @return {number}
 */
var countKeyChanges = function(s) {
  if (s.length === 1) return 0;

  let count = 0;
  for (let i = 1; i < s.length; i++) {
    if (isKeyChanged(s[i], s[i - 1])) count++;
  }
  return count;
};

var isKeyChanged = function(a, b) {
  return a.toLowerCase() !== b.toLowerCase();
}
// @lc code=end



// @lcpr case=start
// "aAbBcC"\n
// @lcpr case=end

// @lcpr case=start
// "AaAaAaaA"\n
// @lcpr case=end

// @lcpr case=start
// "A"\n
// @lcpr case=end
