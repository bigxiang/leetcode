/*
 * @lc app=leetcode.cn id=322 lang=javascript
 * @lcpr version=30204
 *
 * [322] 零钱兑换
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} coins
 * @param {number} amount
 * @return {number}
 */
var coinChange = function(coins, amount) {
  const dp = new Array(amount + 1).fill(Infinity);
  dp[amount] = 0;

  for (let i = amount - 1; i >= 0; i--) {
    for (const coin of coins) {
      if (coin + i > amount) continue;

      dp[i] = Math.min(dp[i], dp[coin + i] + 1);
    }
  }

  return dp[0] === Infinity ? -1 : dp[0];
};
// @lc code=end



// @lcpr case=start
// [1, 2, 5]\n11\n
// @lcpr case=end

// @lcpr case=start
// [2]\n3\n
// @lcpr case=end

// @lcpr case=start
// [1]\n0\n
// @lcpr case=end

// @lcpr case=start
// [1,2,3,5,7,11,13]\n2347\n
// @lcpr case=end


