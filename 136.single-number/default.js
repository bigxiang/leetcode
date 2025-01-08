/*
 * @lc app=leetcode.cn id=136 lang=javascript
 * @lcpr version=30204
 *
 * [136] 只出现一次的数字
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var singleNumber = function(nums) {
  if (nums.length === 1) return nums[0];

  let result = nums[0];
  for (let i = 1; i < nums.length; i++) {
    result ^= nums[i];
  }

  return result;
};
// @lc code=end



// @lcpr case=start
// [2,2,1]\n
// @lcpr case=end

// @lcpr case=start
// [4,1,2,1,2]\n
// @lcpr case=end

// @lcpr case=start
// [1]\n
// @lcpr case=end


