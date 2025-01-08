/*
 * @lc app=leetcode.cn id=2390 lang=javascript
 * @lcpr version=30204
 *
 * [2390] 从字符串中移除星号
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} s
 * @return {string}
 */
var removeStars = function(s) {
  const stack = [];
  for (const c of s) {
    if (c === '*') stack.pop();
    else stack.push(c);
  }
  return stack.join('');
};
// @lc code=end



// @lcpr case=start
// "leet**cod*e"\n
// @lcpr case=end

// @lcpr case=start
// "erase*****"\n
// @lcpr case=end


// @lcpr case=start
// "e*"\n
// @lcpr case=end


// @lcpr case=start
// "e"\n
// @lcpr case=end

