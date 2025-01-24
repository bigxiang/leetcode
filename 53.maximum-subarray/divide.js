/*
 * @lc app=leetcode.cn id=53 lang=javascript
 * @lcpr version=30204
 *
 * [53] 最大子数组和
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {number}
 */
var maxSubArray = function(nums) {
  return maxSum(nums, 0, nums.length - 1).mSum;
};

var maxSum = function(nums, l, r) {
  if (l === r) {
    return {
      lSum: nums[l],
      rSum: nums[l],
      mSum: nums[l],
      iSum: nums[l],
    }
  }

  const mid = l + ((r - l) >> 1);
  const leftSum = maxSum(nums, l, mid);
  const rightSum = maxSum(nums, mid + 1, r);

  return pushUp(leftSum, rightSum);
}

var pushUp = function(leftSum, rightSum) {
  const lSum = Math.max(leftSum.lSum, leftSum.iSum + rightSum.lSum);
  const rSum = Math.max(rightSum.rSum, rightSum.iSum + leftSum.rSum);
  const mSum = Math.max(leftSum.mSum, rightSum.mSum, leftSum.rSum + rightSum.lSum);
  const iSum = leftSum.iSum + rightSum.iSum;

  return {
    lSum,
    rSum,
    mSum,
    iSum,
  }
}
// @lc code=end



// @lcpr case=start
// [-2,1,-3,4,-1,2,1,-5,4]\n
// @lcpr case=end

// @lcpr case=start
// [1]\n
// @lcpr case=end

// @lcpr case=start
// [5,4,-1,7,8]\n
// @lcpr case=end


