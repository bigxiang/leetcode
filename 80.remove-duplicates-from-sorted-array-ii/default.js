/*
 * @lc app=leetcode.cn id=80 lang=javascript
 * @lcpr version=30204
 *
 * [80] 删除有序数组中的重复项 II
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var removeDuplicates = function(nums) {
  let curr = nums[0], count = 1, idx = 1;
  for (let i = 1; i < nums.length; i++) {
    if (nums[i] === curr) {
      if (++count <= 2) {
        nums[idx++] = nums[i];
      }
    } else {
      count = 1;
      curr = nums[i];
      nums[idx++] = nums[i];
    }
  }
  return idx;
};
// @lc code=end



/*
// @lcpr case=start
// [1,1,1,2,2,3]\n
// @lcpr case=end

// @lcpr case=start
// [0,0,1,1,1,1,2,3,3]\n
// @lcpr case=end

// @lcpr case=start
// [0,0,1,1,2,3,3]\n
// @lcpr case=end

// @lcpr case=start
// [0]\n
// @lcpr case=end


 */

