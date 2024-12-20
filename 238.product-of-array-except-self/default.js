/*
 * @lc app=leetcode.cn id=238 lang=javascript
 * @lcpr version=30204
 *
 * [238] 除自身以外数组的乘积
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {number[]}
 */
var productExceptSelf = function(nums) {
  const result = new Array(nums.length).fill(1);
  let product = 1;
  for (let i = 1; i < nums.length; i++) {
    product *= nums[i - 1];
    result[i] = product;
  }
  product = 1;
  for (let i = nums.length - 2; i >= 0; i--) {
    product *= nums[i + 1];
    result[i] *= product;
  }
  return result;
};
// @lc code=end



// @lcpr case=start
// [1,2,3,4]\n
// @lcpr case=end

// @lcpr case=start
// [-1,1,0,-3,3]\n
// @lcpr case=end

