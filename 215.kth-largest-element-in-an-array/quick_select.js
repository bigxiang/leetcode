/*
 * @lc app=leetcode.cn id=215 lang=javascript
 * @lcpr version=30204
 *
 * [215] 数组中的第K个最大元素
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
var findKthLargest = function(nums, k) {
  return quickSelect(nums, 0, nums.length - 1, k);
};

var quickSelect = function(nums, left, right, k) {
  if (left === right) return nums[left];

  const pivot = nums[left];
  let i = left - 1, j = right + 1;
  while (i < j) {
    do i++; while (nums[i] < pivot);
    do j--; while (nums[j] > pivot);
    if (i < j) [nums[i], nums[j]] = [nums[j], nums[i]];
  }

  if (nums.length - k <= j) return quickSelect(nums, left, j, k);
  else return quickSelect(nums, j + 1, right, k);
}
// @lc code=end



// @lcpr case=start
// [3,2,1,5,6,4]\n2\n
// @lcpr case=end

// @lcpr case=start
// [3,2,3,1,2,4,5,5,6]\n4\n
// @lcpr case=end

// @lcpr case=start
// [3]\n1\n
// @lcpr case=end

// @lcpr case=start
// [3,2,4]\n1\n
// @lcpr case=end

// @lcpr case=start
// [1,2,3,4,5,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]\n1\n
// @lcpr case=end
