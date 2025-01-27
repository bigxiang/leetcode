/*
 * @lc app=leetcode.cn id=9 lang=javascript
 * @lcpr version=30204
 *
 * [9] 回文数
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number} x
 * @return {boolean}
 */
var isPalindrome = function(x) {
  if (x < 0) return false;
  if (x === 0) return true;
  if (x % 10 === 0) return false;

  let result = false;
  let rev = 0;
  while (x > rev) {
    d = x % 10;
    x = Math.floor(x / 10);
    if (rev === x) return true;

    rev = rev * 10 + d;
    if (rev === x) return true;
  }

  return result;
};
// @lc code=end



// @lcpr case=start
// 121\n
// @lcpr case=end

// @lcpr case=start
// 1001\n
// @lcpr case=end

// @lcpr case=start
// 12021\n
// @lcpr case=end


// @lcpr case=start
// -121\n
// @lcpr case=end

// @lcpr case=start
// 10\n
// @lcpr case=end

// @lcpr case=start
// 100\n
// @lcpr case=end

// @lcpr case=start
// 1010\n
// @lcpr case=end

