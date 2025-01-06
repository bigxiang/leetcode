/*
 * @lc app=leetcode.cn id=1137 lang=javascript
 * @lcpr version=30204
 *
 * [1137] 第 N 个泰波那契数
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number} n
 * @return {number}
 */
var tribonacci = function(n) {
  const pres = [0, 1, 1];
  if (n < 3) return pres[n];

  let value;
  for (let i = 3; i <= n; i++) {
    value = pres.reduce((acc, cur) => acc + cur, 0);
    [pres[0], pres[1], pres[2]] = [pres[1], pres[2], value];
  }

  return value;
};
// @lc code=end



// @lcpr case=start
// 4\n
// @lcpr case=end

// @lcpr case=start
// 25\n
// @lcpr case=end


