/*
 * @lc app=leetcode.cn id=541 lang=javascript
 * @lcpr version=30204
 *
 * [541] 反转字符串 II
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} s
 * @param {number} k
 * @return {string}
 */
var reverseStr = function(s, k) {
  const result = [];
  let i = 0;
  while (i * k < s.length) {
    const end = Math.min((i + 1) * k, s.length) - 1;
    if (i % 2 === 0) {
      for (let j = end; j >= i * k; j--) result.push(s[j]);
    } else {
      for (let j = i * k; j <= end; j++) result.push(s[j]);
    }
    i++;
  }

  return result.join('');
};
// @lc code=end



// @lcpr case=start
// "abcdefg"\n2\n
// @lcpr case=end

// @lcpr case=start
// "abcd"\n2\n
// @lcpr case=end

// @lcpr case=start
// "abc"\n2\n
// @lcpr case=end

// @lcpr case=start
// "ab"\n2\n
// @lcpr case=end

// @lcpr case=start
// "a"\n2\n
// @lcpr case=end
