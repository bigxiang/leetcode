/*
 * @lc app=leetcode.cn id=643 lang=javascript
 * @lcpr version=30204
 *
 * [643] 子数组最大平均数 I
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
var findMaxAverage = function(nums, k) {
  let left = 0, right = k - 1;
  let sum = nums.slice(left, right + 1).reduce((a, b) => a + b);
  let maxAvg = sum / k;
  for (let right = k; right < nums.length; right++) {
    sum += nums[right];
    sum -= nums[left];
    left++;
    const avg = sum / k;
    maxAvg = Math.max(maxAvg, avg);
  }
  return maxAvg;
};
// @lc code=end



// @lcpr case=start
// [1,12,-5,-6,50,3]\n4\n
// @lcpr case=end

// @lcpr case=start
// [1,12,-5,-6,50,3,3,2,7,-10,25,52,10,-15,-20,-3,67,22,1,2,-4]\n4\n
// @lcpr case=end


// @lcpr case=start
// [5]\n1\n
// @lcpr case=end

// @lcpr case=start
// [5,10]\n1\n
// @lcpr case=end

// @lcpr case=start
// [5,10]\n2\n
// @lcpr case=end
