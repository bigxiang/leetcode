/*
 * @lc app=leetcode.cn id=20 lang=javascript
 * @lcpr version=30204
 *
 * [20] 有效的括号
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} s
 * @return {boolean}
 */
var isValid = function(s) {
  const map = {
    ')': '(',
    ']': '[',
    '}': '{',
  };

  const stack = [];
  for (let i = 0; i < s.length; i++) {
    if (map[s[i]]) {
      if (stack.pop() !== map[s[i]]) return false;
    }
    else {
      stack.push(s[i]);
    }
  }

  return stack.length === 0;
};
// @lc code=end



// @lcpr case=start
// "()"\n
// @lcpr case=end

// @lcpr case=start
// "()[]{}"\n
// @lcpr case=end

// @lcpr case=start
// "(]"\n
// @lcpr case=end

// @lcpr case=start
// "([])"\n
// @lcpr case=end


