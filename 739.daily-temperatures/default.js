/*
 * @lc app=leetcode.cn id=739 lang=javascript
 * @lcpr version=30204
 *
 * [739] 每日温度
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} temperatures
 * @return {number[]}
 */
var dailyTemperatures = function(temperatures) {
  const result = new Array(temperatures.length).fill(0);
  const stack = [];
  for (let i = temperatures.length - 1; i >= 0; i--) {
    while (stack.length > 0 && temperatures[stack[stack.length - 1]] <= temperatures[i]) {
      stack.pop();
    }

    result[i] = stack.length === 0 ? 0 : stack[stack.length - 1] - i;
    stack.push(i);
  }

  return result;
};
// @lc code=end



// @lcpr case=start
// [73,74,75,71,69,72,76,73]\n
// @lcpr case=end

// @lcpr case=start
// [30,40,50,60]\n
// @lcpr case=end

// @lcpr case=start
// [30,60,90]\n
// @lcpr case=end


