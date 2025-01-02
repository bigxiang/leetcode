/*
 * @lc app=leetcode.cn id=334 lang=javascript
 * @lcpr version=30204
 *
 * [334] 递增的三元子序列
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {boolean}
 */
var increasingTriplet = function(nums) {
  if (nums.length < 3) return false;

  let first = nums[0], second = Number.MAX_SAFE_INTEGER;
  for (let i = 1; i < nums.length; i++) {
    if (nums[i] > second) return true;
    if (nums[i] > first && nums[i] < second) second = nums[i];
    if (nums[i] < first) first = nums[i];
  }
  return false;
};
// @lc code=end



// @lcpr case=start
// [1,2,3,4,5]\n
// @lcpr case=end

// @lcpr case=start
// [5,4,3,2,1]\n
// @lcpr case=end

// @lcpr case=start
// [2,1,5,0,4,6]\n
// @lcpr case=end

// @lcpr case=start
// [2]\n
// @lcpr case=end

// @lcpr case=start
// [2,3]\n
// @lcpr case=end

// @lcpr case=start
// [20,100,10,14,11,5,4,3,13]\n
// @lcpr case=end

// @lcpr case=start
// [20,100,10,14,11,13]\n
// @lcpr case=end
