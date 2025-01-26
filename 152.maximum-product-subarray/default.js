/*
 * @lc app=leetcode.cn id=152 lang=javascript
 * @lcpr version=30204
 *
 * [152] 乘积最大子数组
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var maxProduct = function(nums) {
  let max = -Infinity;
  let iMax = 1, iMin = 1;
  for (let i = 0; i < nums.length; i++) {
    const currMin = iMin * nums[i], currMax = iMax * nums[i];
    iMax = Math.max(currMax, currMin, nums[i]);
    iMin = Math.min(currMax, currMin, nums[i]);
    max = Math.max(iMax, max);
  }
  return max;
};
// @lc code=end



// @lcpr case=start
// [2,3,-2,4]\n
// @lcpr case=end

// @lcpr case=start
// [-2,0,-1]\n
// @lcpr case=end

// @lcpr case=start
// [3]\n
// @lcpr case=end

// @lcpr case=start
// [3,2,-3,2,1,4,-5,2,7,9,3,-8,-2,-3,-4,3]\n
// @lcpr case=end
