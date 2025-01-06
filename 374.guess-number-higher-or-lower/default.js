/*
 * @lc app=leetcode.cn id=374 lang=javascript
 * @lcpr version=30204
 *
 * [374] 猜数字大小
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * Forward declaration of guess API.
 * @param {number} num   your guess
 * @return 	     -1 if num is higher than the picked number
 *			      1 if num is lower than the picked number
 *               otherwise return 0
 * var guess = function(num) {}
 */

/**
 * @param {number} n
 * @return {number}
 */
var guessNumber = function(n) {
  let left = 1;
  let right = n;
  while (left <= right) {
    const mid = left + Math.floor((right - left) / 2);

    if (guess(mid) === 0) return mid;
    if (guess(mid) === 1) left = mid + 1;
    else right = mid - 1;
  }
};
// @lc code=end



// @lcpr case=start
// 10\n6\n
// @lcpr case=end

// @lcpr case=start
// 1\n1\n
// @lcpr case=end

// @lcpr case=start
// 2\n1\n
// @lcpr case=end

// @lcpr case=start
// 2126753390\n1702766719\n
// @lcpr case=end


