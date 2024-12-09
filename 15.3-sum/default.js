/*
 * @lc app=leetcode.cn id=15 lang=javascript
 * @lcpr version=30204
 *
 * [15] 三数之和
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var threeSum = function(nums) {
  nums = nums.sort((a, b) => a - b);
  let result = [];
  for (let i = 0; i < nums.length - 2; i++) {
    if (i > 0 && nums[i] === nums[i - 1]) continue;

    const twoSumResult = sortedTwoSums(nums, i + 1, -nums[i]);
    twoSumResult.forEach((twoSum) => {
      result.push([nums[i], ...twoSum]);
    })
  }
  return result;
};

const sortedTwoSums = (nums, start, target) => {
  let result = [];
  let left = start;
  let right = nums.length - 1;
  while (left < right) {
    const sum = nums[left] + nums[right];
    if ((left > start && nums[left] === nums[left - 1]) || sum < target) {
      left++;
    } else if ((right < nums.length - 1 && nums[right] === nums[right + 1]) || sum > target) {
      right--;
    } else {
      result.push([nums[left], nums[right]]);
      left++;
      right--;
    }
  }
  return result;
}
// @lc code=end



// @lcpr case=start
// [-1,0,1,2,-1,-4]\n
// @lcpr case=end

// @lcpr case=start
// [0,1,1]\n
// @lcpr case=end

// @lcpr case=start
// [0,0,0]\n
// @lcpr case=end


