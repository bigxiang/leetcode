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

  const count1 = new Array(26).fill(0);
  const count2 = new Array(26).fill(0);

  for (let i = 0; i < word1.length; i++) {
    count1[word1.charCodeAt(i) - 'a'.charCodeAt(0)]++;
    count2[word2.charCodeAt(i) - 'a'.charCodeAt(0)]++;
  }

  const countMap = new Map();
  for (let i = 0; i < 26; i++) {
    if (count1[i] === 0 && count2[i] !== 0 || count1[i] !== 0 && count2[i] === 0) return false;

    if (count1[i] === 0) continue;

    countMap.set(count1[i], (countMap.get(count1[i]) || 0) + 1);
    countMap.set(count2[i], (countMap.get(count2[i]) || 0) - 1);
  }

  for (let [_count, times] of countMap) {
    if (times !== 0) return false;
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

// @lcpr case=start
// "abbzzca"\n"babzzcz"\n
// @lcpr case=end
