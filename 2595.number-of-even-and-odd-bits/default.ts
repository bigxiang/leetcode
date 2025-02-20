/*
 * @lc app=leetcode.cn id=2595 lang=typescript
 * @lcpr version=30204
 *
 * [2595] 奇偶位数
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
function evenOddBit(n: number): number[] {
  let odd = 0;
  let even = 0;
  let i = 0;
  while (n > 0) {
    if (i % 2 === 0) even += n & 1;
    else odd += n & 1;
    n >>= 1;
    i++;
  }
  return [even, odd];
};
// @lc code=end



// @lcpr case=start
// 50\n
// @lcpr case=end

// @lcpr case=start
// 2\n
// @lcpr case=end


