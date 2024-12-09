/*
 * @lc app=leetcode.cn id=283 lang=javascript
 * @lcpr version=30204
 *
 * [283] 移动零
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {void} Do not return anything, modify nums in-place instead.
 */
var moveZeroes = function(nums) {
  let zeroPos = 0;
  for (let i = 0; i < nums.length; i++) {
    if (nums[i] !== 0) {
      nums[zeroPos++] = nums[i];
    }
  }
  for (let i = zeroPos; i < nums.length; i++) {
    nums[i] = 0;
  }
};
// @lc code=end



// @lcpr case=start
// [0,1,0,3,12]\n
// @lcpr case=end

// @lcpr case=start
// [0]\n
// @lcpr case=end

// @lcpr case=start
// [1]\n
// @lcpr case=end

// @lcpr case=start
// [1,0,2,0,3,0,4,0]\n
// @lcpr case=end
