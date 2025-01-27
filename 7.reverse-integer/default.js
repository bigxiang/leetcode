/*
 * @lc app=leetcode.cn id=7 lang=javascript
 * @lcpr version=30204
 *
 * [7] 整数反转
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number} x
 * @return {number}
 */
var reverse = function(x) {
  let result = 0;
  const max = Math.floor((2 ** 31 - 1) / 10);
  const min = Math.ceil(-(2 ** 31 / 10));

  while (x !== 0) {
    const d = x % 10;

    if (result > max || result === max && d > 7) return 0;
    if (result < min || result === min && d < -8) return 0;

    x = x > 0 ? Math.floor(x / 10) : Math.ceil(x / 10);
    result = result * 10 + d;
  }
  return result;
};
// @lc code=end



// @lcpr case=start
// 123\n
// @lcpr case=end

// @lcpr case=start
// -123\n
// @lcpr case=end

// @lcpr case=start
// 120\n
// @lcpr case=end

// @lcpr case=start
// 0\n
// @lcpr case=end

// @lcpr case=start
// 1534236469\n
// @lcpr case=end
