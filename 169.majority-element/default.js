/*
 * @lc app=leetcode.cn id=169 lang=javascript
 * @lcpr version=30204
 *
 * [169] 多数元素
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var majorityElement = function(nums) {
  let majority = nums[0], count = 1;

  for (let i = 1; i < nums.length; i++) {
    if (nums[i] === majority) count++;
    else {
      count--;
      if (count === 0) {
        majority = nums[i];
        count++;
      }
    }
  }

  return majority;
};
// @lc code=end



/*
// @lcpr case=start
// [3,2,3]\n
// @lcpr case=end

// @lcpr case=start
// [2,2,1,1,1,2,2]\n
// @lcpr case=end

// @lcpr case=start
// [1]\n
// @lcpr case=end
 */

