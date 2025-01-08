/*
 * @lc app=leetcode.cn id=338 lang=javascript
 * @lcpr version=30204
 *
 * [338] 比特位计数
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number} n
 * @return {number[]}
 */
var countBits = function(n) {
  const result = [];
  for (let i = 0; i <= n; i++) {
    let count = 0;
    let num = i;
    while (num > 0) {
      count += (num & 1);
      num >>= 1;
    }
    result.push(count);
  }
  return result;
};
// @lc code=end



// @lcpr case=start
// 2\n
// @lcpr case=end

// @lcpr case=start
// 5\n
// @lcpr case=end


