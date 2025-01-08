/*
 * @lc app=leetcode.cn id=1207 lang=javascript
 * @lcpr version=30204
 *
 * [1207] 独一无二的出现次数
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} arr
 * @return {boolean}
 */
var uniqueOccurrences = function(arr) {
  const countMap = new Map();

  for (const num of arr) {
    countMap.set(num, (countMap.get(num) || 0) + 1);
  }

  return new Set(countMap.values()).size === countMap.size;
};
// @lc code=end



// @lcpr case=start
// [1,2,2,1,1,3]\n
// @lcpr case=end

// @lcpr case=start
// [1,2]\n
// @lcpr case=end

// @lcpr case=start
// [-3,0,1,-3,1,1,1,-3,10,0]\n
// @lcpr case=end


