/*
 * @lc app=leetcode.cn id=50 lang=javascript
 * @lcpr version=30204
 *
 * [50] Pow(x, n)
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number} x
 * @param {number} n
 * @return {number}
 */
var myPow = function(x, n) {
  if (n < 0) return 1 / myPow(x, -n);
  if (n === 0) return 1;

  const mod = n % 2;
  return mod === 0 ? myPow(x, n / 2) ** 2 : myPow(x, (n - 1) / 2) ** 2 * x;
};
// @lc code=end



// @lcpr case=start
// 2.00000\n10\n
// @lcpr case=end

// @lcpr case=start
// 2.10000\n3\n
// @lcpr case=end

// @lcpr case=start
// 2.00000\n-2\n
// @lcpr case=end

// @lcpr case=start
// 2.00000\n0\n
// @lcpr case=end

// @lcpr case=start
// 0\n1\n
// @lcpr case=end
