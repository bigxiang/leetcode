/*
 * @lc app=leetcode.cn id=190 lang=javascript
 * @lcpr version=30204
 *
 * [190] 颠倒二进制位
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number} n - a positive integer
 * @return {number} - a positive integer
 */
var reverseBits = function(n) {
  const m1 = 0x55555555;
  const m2 = 0x33333333;
  const m4 = 0x0f0f0f0f;
  const m8 = 0x00ff00ff;
  let result = 0;
  result = ((n >>> 1) & m1) | ((n & m1) << 1);
  result = ((result >>> 2) & m2) | ((result & m2) << 2);
  result = ((result >>> 4) & m4) | ((result & m4) << 4);
  result = ((result >>> 8) & m8) | ((result & m8) << 8);
  result = (result >>> 16) | (result << 16);
  return result >>> 0;
};
// @lc code=end



// @lcpr case=start
// 00000010100101000001111010011100\n
// @lcpr case=end

// @lcpr case=start
// 11111111111111111111111111111101\n
// @lcpr case=end


