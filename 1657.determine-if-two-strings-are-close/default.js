/*
 * @lc app=leetcode.cn id=1657 lang=javascript
 * @lcpr version=30204
 *
 * [1657] 确定两个字符串是否接近
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} word1
 * @param {string} word2
 * @return {boolean}
 */
var closeStrings = function(word1, word2) {
  if (word1.length !== word2.length) return false;

  const word1Count = new Array(26).fill(0);
  for (c of word1) word1Count[c.charCodeAt() - 'a'.charCodeAt()]++;
  const word1CountMap = new Map();
  for (let i = 0; i < word1Count.length; i++) {
    if (word1Count[i] !== 0) word1CountMap.set(word1Count[i], (word1CountMap.get(word1Count[i]) || 0) + 1);
  }

  const word2Count = new Array(26).fill(0);
  for (c of word2) word2Count[c.charCodeAt() - 'a'.charCodeAt()]++;
  for (let i = 0; i < word2Count.length; i++) {
    if (word2Count[i] !== 0) {
      if (word1Count[i] === 0) return false;
      if (!word1CountMap.has(word2Count[i])) return false;

      word1CountMap.set(word2Count[i], word1CountMap.get(word2Count[i]) - 1);
      if (word1CountMap.get(word2Count[i]) === 0) word1CountMap.delete(word2Count[i]);
    }
  }

  return true;
};
// @lc code=end



// @lcpr case=start
// "abc"\n"bca"\n
// @lcpr case=end

// @lcpr case=start
// "a"\n"aa"\n
// @lcpr case=end

// @lcpr case=start
// "cabbba"\n"abbccc"\n
// @lcpr case=end

// @lcpr case=start
// "uau"\n"ssx"\n
// @lcpr case=end
