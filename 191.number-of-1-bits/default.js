/*
 * @lc app=leetcode.cn id=191 lang=javascript
 * @lcpr version=30204
 *
 * [191] 位1的个数
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number} n
 * @return {number}
 */
var hammingWeight = function(n) {
  let weight = 0;
  while (n > 0) {
    n = n & (n - 1);
    weight++;
  }
  return weight;
};
// @lc code=end



// @lcpr case=start
// 11\n
// @lcpr case=end

// @lcpr case=start
// 128\n
// @lcpr case=end

// @lcpr case=start
// 2147483645\n
// @lcpr case=end


