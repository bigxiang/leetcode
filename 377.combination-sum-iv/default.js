/*
 * @lc app=leetcode.cn id=377 lang=javascript
 * @lcpr version=30204
 *
 * [377] 组合总和 Ⅳ
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var combinationSum4 = function(nums, target) {
  const dp = new Array(target + 1).fill(0);
  dp[0] = 1;
  for (let i = 1; i <= target; i++) {
    for (let num of nums) {
      if (i >= num) dp[i] += dp[i - num];
    }
  }
  return dp[target];
};
// @lc code=end


// @lcpr case=start
// [1,2,3]\n4\n
// @lcpr case=end

// @lcpr case=start
// [1,2,3,4,5,6]\n30\n
// @lcpr case=end

// @lcpr case=start
// [9]\n3\n
// @lcpr case=end


