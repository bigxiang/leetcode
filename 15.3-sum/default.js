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
  const res = [];

  for (let i = 0; i < nums.length - 2; i++) {
    if (i > 0 && nums[i] === nums[i - 1]) continue;

    const twoSums = sortedTwoSum(nums, -nums[i], i + 1, nums.length - 1);
    for (const twoSum of twoSums) {
      res.push([nums[i], ...twoSum]);
    }
  }

  return res;
};

var sortedTwoSum = function(nums, target, start, end) {
  const res = [];
  let left = start, right = end;

  while (left < right) {
    if (left > start && nums[left] === nums[left - 1]) {
      left++;
      continue;
    }
    if (right < end && nums[right] === nums[right + 1]) {
      right--;
      continue;
    }

    const sum = nums[left] + nums[right];
    if (sum === target) res.push([nums[left++], nums[right--]]);
    else if (sum < target) left++;
    else right--;
  }

  return res;
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


