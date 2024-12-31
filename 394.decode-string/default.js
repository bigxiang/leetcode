/*
 * @lc app=leetcode.cn id=394 lang=javascript
 * @lcpr version=30204
 *
 * [394] 字符串解码
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} s
 * @return {string}
 */
var decodeString = function(s) {
  const segments = [];

  let buffer = '';
  for (let i = 0; i < s.length; i++) {
    if (s[i] >= 'a' && s[i] <= 'z') {
      buffer += s[i];
    }
    else if (s[i] >= '0' && s[i] <= '9') {
      if (i > 0 && s[i-1] >= '0' && s[i-1] <= '9') {
        buffer = buffer * 10 + Number(s[i]);
      }
      else if (i > 0 && s[i-1] >= 'a' && s[i-1] <= 'z') {
        segments.push(buffer);
        buffer = Number(s[i]);
      } else buffer = Number(s[i]);
    }
    else if (s[i] === '[') {
      segments.push(buffer);
      segments.push('[');
      buffer = '';
    }
    else if (s[i] === ']') {
      let temp = segments.pop();
      while (temp !== '[') {
        buffer = temp + buffer;
        temp = segments.pop();
      }
      const count = segments.pop();
      buffer = buffer.repeat(count);
      segments.push(buffer);
      buffer = '';
    }
    else {
      throw new Error('invalid input');
    }
  }

  segments.push(buffer);

  return segments.join('');
};
// @lc code=end



// @lcpr case=start
// "3[a]2[bc]"\n
// @lcpr case=end

// @lcpr case=start
// "3[a2[c]b]"\n
// @lcpr case=end

// @lcpr case=start
// "2[abc]3[cd]ef"\n
// @lcpr case=end

// @lcpr case=start
// "abc3[cd]xyz"\n
// @lcpr case=end


