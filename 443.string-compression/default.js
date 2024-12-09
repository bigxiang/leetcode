/*
 * @lc app=leetcode.cn id=443 lang=javascript
 * @lcpr version=30204
 *
 * [443] 压缩字符串
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {character[]} chars
 * @return {number}
 */
var compress = function(chars) {
  let index = 0;
  let i = 0;

  while (i < chars.length) {
    let char = chars[i];
    let count = 0;

    while (i < chars.length && chars[i] === char) {
      count++;
      i++;
    }

    chars[index++] = char;
    if (count > 1) {
      const countStr = count.toString();
      for (let j = 0; j < countStr.length; j++) {
        chars[index++] = countStr[j];
      }
    }
  }

  return index;
};
// @lc code=end



// @lcpr case=start
// ["a","a","b","b","c","c","c"]\n
// @lcpr case=end

// @lcpr case=start
// ["a"]\n
// @lcpr case=end

// @lcpr case=start
// ["a","b","b","b","b","b","b","b","b","b","b","b","b"]\n
// @lcpr case=end

// @lcpr case=start
// ["a","b","c","d","e","f","g"]\n
// @lcpr case=end

