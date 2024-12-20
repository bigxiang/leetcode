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
  const min = - (2 ** 31);
  const max = 2 ** 31 - 1;
  let sign = 1;
  let result = 0;
  let leading = true;
  for (let i = 0; i < s.length; i++) {
    if (s[i] === ' ') {
      if (leading) continue;
      else break;
    }
    else if (s[i] === '-' || s[i] === '+') {
      if (leading) {
        sign = s[i] === '-' ? -1 : 1;
        leading = false;
      }
      else break;
    }
    else if (s[i] >= '0' && s[i] <= 9) {
      leading = false;
      result = result * 10 + sign * Number(s[i]);
      if (result >= max) return max;
      if (result <= min) return min;
    }
    else break;
  }

  return result;
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

