/*
 * @lc app=leetcode.cn id=70 lang=javascript
 * @lcpr version=30204
 *
 * [70] 爬楼梯
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number} n
 * @return {number}
 */
var climbStairs = function(n) {
  if (n === 1) return 1;

  let pre2 = 1; pre1 = 1;
  for (let i = 2; i <= n; i++) {
    const cur = pre1 + pre2;
    pre2 = pre1;
    pre1 = cur;
  }
  return pre1;
};
// @lc code=end


// @lcpr case=start
// 1\n
// @lcpr case=end

// @lcpr case=start
// 2\n
// @lcpr case=end

// @lcpr case=start
// 3\n
// @lcpr case=end

// @lcpr case=start
// 4\n
// @lcpr case=end
