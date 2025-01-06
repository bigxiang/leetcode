/*
 * @lc app=leetcode.cn id=162 lang=javascript
 * @lcpr version=30204
 *
 * [162] 寻找峰值
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var findPeakElement = function(nums) {
  if (nums.length === 1) return 0;

  return findPeak(nums, 0, nums.length - 1);
};

var findPeak = function(nums, l, r) {
  if (l > r) return null;

  const mid = l + ((r - l) >> 1);
  if (mid === 0) return (nums[mid] > nums[mid+1]) ? mid : findPeak(nums, mid+1, r);
  if (mid === nums.length - 1) return (nums[mid] > nums[mid-1]) ? mid : findPeak(nums, l, mid-1);
  if (nums[mid] > nums[mid-1] && nums[mid] > nums[mid+1]) return mid;

  leftPeak = findPeak(nums, l, mid-1);

  return (leftPeak || leftPeak === 0) ? leftPeak : findPeak(nums, mid+1, r);
}
// @lc code=end



// @lcpr case=start
// [1,2,3,1]\n
// @lcpr case=end

// @lcpr case=start
// [1,2,1,3,5,6,4]\n
// @lcpr case=end

// @lcpr case=start
// [1,2,3,4,5]\n
// @lcpr case=end

// @lcpr case=start
// [5,4,3,2,1]\n
// @lcpr case=end

// @lcpr case=start
// [5,4]\n
// @lcpr case=end
