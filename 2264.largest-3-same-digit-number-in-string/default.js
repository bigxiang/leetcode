/*
 * @lc app=leetcode.cn id=2264 lang=javascript
 * @lcpr version=30204
 *
 * [2264] 字符串中最大的 3 位相同数字
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} num
 * @return {string}
 */
var largestGoodInteger = function(num) {
  let count = 0;
  let max = '';
  for (let i = 0; i < num.length; i++) {
    if (i === 0 || num[i] !== num[i-1]) {
      count = 1;
    }
    else count++;

    if (count === 3) {
      if (num[i] > max) max = num[i].repeat(3);
      if (max === '999') return '999';
      count = 0;
    }
  }
  return max;
};
// @lc code=end



// @lcpr case=start
// "6777133339"\n
// @lcpr case=end

// @lcpr case=start
// "2300019"\n
// @lcpr case=end

// @lcpr case=start
// "42352338"\n
// @lcpr case=end


