/*
 * @lc app=leetcode.cn id=8 lang=javascript
 * @lcpr version=30204
 *
 * [8] 字符串转换整数 (atoi)
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} s
 * @return {number}
 */
var myAtoi = function(s) {
  const min = -(2 ** 31);
  const max = (2 ** 31) - 1;
  let res = 0;
  let leading = true;
  let sign = 1;

  for (let i = 0; i < s.length; i++) {
    const c = s[i];

    if (c === ' ') {
      if (leading) continue;
      return res;
    }
    else if (c === '-' || c === '+') {
      if (leading) {
        sign = c === '-' ? -1 : 1;
        leading = false;
      }
      else {
        return res;
      }
    }
    else if (c >= '0' && c <= '9') {
      res = res * 10 + (c.charCodeAt(0) - '0'.charCodeAt(0)) * sign;
      leading = false;
      if (res > max) return max;
      if (res < min) return min;
    }
    else {
      return res;
    }
  }

  return res;
};
// @lc code=end



// @lcpr case=start
// "42"\n
// @lcpr case=end

// @lcpr case=start
// " -042"\n
// @lcpr case=end

// @lcpr case=start
// "1337c0d3"\n
// @lcpr case=end

// @lcpr case=start
// "0-1"\n
// @lcpr case=end

// @lcpr case=start
// "words and 987"\n
// @lcpr case=end

// @lcpr case=start
// ""\n
// @lcpr case=end

// @lcpr case=start
// "-"\n
// @lcpr case=end

// @lcpr case=start
// "  --1"\n
// @lcpr case=end

// @lcpr case=start
// "--1"\n
// @lcpr case=end

// @lcpr case=start
// "+1"\n
// @lcpr case=end

