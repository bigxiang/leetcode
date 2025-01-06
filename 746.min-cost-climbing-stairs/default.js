/*
 * @lc app=leetcode.cn id=746 lang=javascript
 * @lcpr version=30204
 *
 * [746] 使用最小花费爬楼梯
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} cost
 * @return {number}
 */
var minCostClimbingStairs = function(cost) {
  let pre2 = 0;
  let pre1 = cost[0];
  let curr;
  for (let i = 1; i <= cost.length; i++) {
    curr = Math.min(pre1, pre2) + (cost[i] || 0);
    [pre2, pre1] = [pre1, curr];
  }

  return curr;
};
// @lc code=end



// @lcpr case=start
// [10,15,20]\n
// @lcpr case=end

// @lcpr case=start
// [1,100,1,1,1,100,1,1,100,1]\n
// @lcpr case=end


