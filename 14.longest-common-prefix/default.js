/*
 * @lc app=leetcode.cn id=14 lang=javascript
 * @lcpr version=30204
 *
 * [14] 最长公共前缀
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string[]} strs
 * @return {string}
 */
var longestCommonPrefix = function(strs) {
  if (strs.length === 1) return strs[0];

  const str = strs[0];
  let j;
  for (j = 0; j < str.length; j++) {
    for (let i = 1; i < strs.length; i++) {
      if (j < strs[i].length && strs[i][j] === str[j]) {
        continue;
      } else {
        return str.slice(0, j);
      }
    }
  }

  return str.slice(0, j);
};
// @lc code=end



// @lcpr case=start
// ["flower","flow","flight"]\n
// @lcpr case=end

// @lcpr case=start
// ["dog","racecar","car"]\n
// @lcpr case=end

// @lcpr case=start
// ["dog"]\n
// @lcpr case=end

// @lcpr case=start
// ["dog", "dog"]\n
// @lcpr case=end
