/*
 * @lc app=leetcode.cn id=714 lang=javascript
 * @lcpr version=30204
 *
 * [714] 买卖股票的最佳时机含手续费
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} prices
 * @param {number} fee
 * @return {number}
 */
var maxProfit = function(prices, fee) {
  const cache = new Array(prices.length).fill(0).map(() => new Array(2).fill(-1));

  return dfs(prices, prices.length-1, fee, cache)[1];
};

var dfs = function(prices, i, fee, cache) {
  if (i < 0) return [Number.MIN_SAFE_INTEGER, 0];

  if (cache[i][0] !== -1) return cache[i];

  const curr = dfs(prices, i-1, fee, cache);
  cache[i][0] = Math.max(curr[0], curr[1] - prices[i]);
  cache[i][1] = Math.max(curr[1], curr[0] + prices[i] - fee);

  return cache[i];
}
// @lc code=end



// @lcpr case=start
// [1, 3, 2, 8, 4, 9]\n2\n
// @lcpr case=end

// @lcpr case=start
// [1,3,7,5,10,3]\n3\n
// @lcpr case=end


