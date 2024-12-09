/*
 * @lc app=leetcode.cn id=1071 lang=javascript
 * @lcpr version=30204
 *
 * [1071] 字符串的最大公因子
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} str1
 * @param {string} str2
 * @return {string}
 */
var gcdOfStrings = function(str1, str2) {
  const n = gcd(str1.length, str2.length);
  const substring = str1.slice(0, n);
  if (substring.repeat(str1.length / n) === str1 && substring.repeat(str2.length / n) === str2) return substring;
  return '';
};

const gcd = (a, b) => {
  return b === 0 ? a : gcd(b, a % b);
}
// @lc code=end



// @lcpr case=start
// "ABCABC"\n"ABC"\n
// @lcpr case=end

// @lcpr case=start
// "ABABAB"\n"ABAB"\n
// @lcpr case=end

// @lcpr case=start
// "LEET"\n"CODE"\n
// @lcpr case=end


