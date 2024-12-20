/*
 * @lc app=leetcode.cn id=121 lang=javascript
 * @lcpr version=30204
 *
 * [121] 买卖股票的最佳时机
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} prices
 * @return {number}
 */
var maxProfit = function(prices) {
  let bestBuy = -prices[0];
  let maxProfit = 0;

  for (let i = 1; i < prices.length; i++) {
    maxProfit = Math.max(maxProfit, prices[i] + bestBuy);
    bestBuy = Math.max(bestBuy, -prices[i]);
  }

  return maxProfit;
};
// @lc code=end



/*
// @lcpr case=start
// [7,1,5,3,6,4]\n
// @lcpr case=end

// @lcpr case=start
// [7,6,4,3,1]\n
// @lcpr case=end

// @lcpr case=start
// [7]\n
// @lcpr case=end

// @lcpr case=start
// [7,6,4,3,1,10,9,7,5,2,13,2,3,8,22,15,10,2,5,1]\n
// @lcpr case=end


 */

