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

  const first = strs[0];
  let index = 0;
  while (index < first.length) {
    for (let i = 1; i < strs.length; i++) {
      if (index > strs[i].length - 1 || first[index] !== strs[i][index]) return first.slice(0, index);
    }
    index++;
  }
  return first;
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
