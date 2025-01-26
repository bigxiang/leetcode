/*
 * @lc app=leetcode.cn id=67 lang=javascript
 * @lcpr version=30204
 *
 * [67] 二进制求和
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} a
 * @param {string} b
 * @return {string}
 */
var addBinary = function(a, b) {
  let i = 0;
  let carry = 0;
  let maxLength = Math.max(a.length, b.length);
  const result = [];
  while (i < maxLength) {
    const num1 = i < a.length ? Number(a[a.length - i - 1]) : 0;
    const num2 = i < b.length ? Number(b[b.length - i - 1]) : 0;
    const sum = num1 + num2 + carry;
    result.push(sum % 2);
    carry = sum >= 2 ? 1 : 0;
    i++;
  }
  if (carry > 0) result.push(carry);

  return result.reverse().join('');
};
// @lc code=end



// @lcpr case=start
// "11"\n"1"\n
// @lcpr case=end

// @lcpr case=start
// "1010"\n"1011"\n
// @lcpr case=end


