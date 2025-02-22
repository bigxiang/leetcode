/*
 * @lc app=leetcode.cn id=2506 lang=typescript
 * @lcpr version=30204
 *
 * [2506] 统计相似字符串对的数目
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
function similarPairs(words: string[]): number {
  const wordMap = new Map();
  let result = 0;
  for (let i = 0; i < words.length; i++) {
    let key = 0;
    for (let j = 0; j < words[i].length; j++) {
      key |= 1 << (words[i].charCodeAt(j) - 'a'.charCodeAt(0));
    }
    result += wordMap.get(key) || 0;
    wordMap.set(key, (wordMap.get(key) || 0) + 1);
  }

  return result;
};
// @lc code=end



// @lcpr case=start
// ["aba","aabb","abcd","bac","aabc"]\n
// @lcpr case=end

// @lcpr case=start
// ["aabb","ab","ba"]\n
// @lcpr case=end

// @lcpr case=start
// ["nba","cba","dba"]\n
// @lcpr case=end


