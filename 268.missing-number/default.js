/*
 * @lc app=leetcode.cn id=268 lang=javascript
 * @lcpr version=30204
 *
 * [268] 丢失的数字
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var missingNumber = function(nums) {
  let result = 0;
  for (let i = 0; i < nums.length; i++) {
    result ^= i ^ nums[i];
  }
  result ^= nums.length;
  return result;
};
// @lc code=end



// @lcpr case=start
// [3,0,1]\n
// @lcpr case=end

// @lcpr case=start
// [0,1]\n
// @lcpr case=end

// @lcpr case=start
// [9,6,4,2,3,5,7,0,1]\n
// @lcpr case=end


