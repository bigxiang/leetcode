/*
 * @lc app=leetcode.cn id=334 lang=javascript
 * @lcpr version=30204
 *
 * [334] 递增的三元子序列
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {boolean}
 */
var increasingTriplet = function(nums) {
  if (nums.length < 3) return false;

  let i = 0, j = 1, k = 2;
  while (k < nums.length) {
    if (nums[i] < nums[j] && nums[j] < nums[k]) return true;
    if (nums[i] >= nums[j]) {
      if (nums[j] >= nums[k]) {
        i = k;
        j = i + 1;
        k = i + 2;
      }
      else {
        i = j;
        j = k;
        k++;
      }
    }
    else {
      if (k - j === 1) k++;
      else {
        if (nums[k-1] >= nums[k]) {
          if (nums[k-1] < nums[j] && nums[k-1] > nums[i]) j = k-1;
          k++;
        }
        else {
          j = k - 1;
        }
      }
    }
  }
  return false
};
// @lc code=end



// @lcpr case=start
// [1,2,3,4,5]\n
// @lcpr case=end

// @lcpr case=start
// [5,4,3,2,1]\n
// @lcpr case=end

// @lcpr case=start
// [2,1,5,0,4,6]\n
// @lcpr case=end

// @lcpr case=start
// [2]\n
// @lcpr case=end

// @lcpr case=start
// [2,3]\n
// @lcpr case=end

// @lcpr case=start
// [20,100,10,14,11,5,4,3,13]\n
// @lcpr case=end

// @lcpr case=start
// [20,100,10,14,11,13]\n
// @lcpr case=end
