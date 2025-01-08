/*
 * @lc app=leetcode.cn id=1318 lang=javascript
 * @lcpr version=30204
 *
 * [1318] 或运算的最小翻转次数
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number} a
 * @param {number} b
 * @param {number} c
 * @return {number}
 */
var minFlips = function(a, b, c) {
  let count = 0;

  while (a > 0 || b > 0 || c > 0) {
    const aBit = a & 1, bBit = b & 1, cBit = c & 1;
    if ((aBit | bBit) !== cBit) {
      if (cBit === 1) count += 1;
      else ((aBit & bBit) === 1) ? count += 2 : count += 1;
    }

    a >>= 1, b >>= 1, c >>= 1;
  }

  return count;
};
// @lc code=end



// @lcpr case=start
// 2\n6\n5\n
// @lcpr case=end

// @lcpr case=start
// 4\n2\n7\n
// @lcpr case=end

// @lcpr case=start
// 1\n2\n3\n
// @lcpr case=end

// @lcpr case=start
// 8\n3\n5\n
// @lcpr case=end
