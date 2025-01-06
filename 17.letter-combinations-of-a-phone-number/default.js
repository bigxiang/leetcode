/*
 * @lc app=leetcode.cn id=17 lang=javascript
 * @lcpr version=30204
 *
 * [17] 电话号码的字母组合
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {string} digits
 * @return {string[]}
 */
var letterCombinations = function(digits) {
  const map = new Map([
    ['2', 'abc'],
    ['3', 'def'],
    ['4', 'ghi'],
    ['5', 'jkl'],
    ['6', 'mno'],
    ['7', 'pqrs'],
    ['8', 'tuv'],
    ['9', 'wxyz'],
  ]);

  const result = [];

  dfs(digits, 0, '', map, result);

  return result;
};

var dfs = function(digits, i, seq, map, result) {
  if (i >= digits.length) {
    if (seq.length > 0) result.push(seq);
    return;
  }

  const letters = map.get(digits[i]);
  for (const letter of letters) {
    dfs(digits, i+1, seq+letter, map, result)
  }
}
// @lc code=end



// @lcpr case=start
// "23"\n
// @lcpr case=end

// @lcpr case=start
// ""\n
// @lcpr case=end

// @lcpr case=start
// "2"\n
// @lcpr case=end


