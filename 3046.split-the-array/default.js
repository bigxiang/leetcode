/*
 * @lc app=leetcode.cn id=3046 lang=javascript
 * @lcpr version=30204
 *
 * [3046] 分割数组
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {boolean}
 */
var isPossibleToSplit = function(nums) {
  const numsMap = new Map();
  for (num of nums) {
    numsMap.set(num, (numsMap.get(num) || 0) + 1);

    if (numsMap.get(num) > 2) return false;
  }

  return true;
};
// @lc code=end



// @lcpr case=start
// [1,1,2,2,3,4]\n
// @lcpr case=end

// @lcpr case=start
// [1,1,1,1]\n
// @lcpr case=end

// @lcpr case=start
// [1,1,1,2,2,2]\n
// @lcpr case=end
