/*
 * @lc app=leetcode.cn id=1679 lang=javascript
 * @lcpr version=30204
 *
 * [1679] K 和数对的最大数目
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
var maxOperations = function(nums, k) {
  const numsMap = new Map();
  let count = 0;
  for (let i = 0; i < nums.length; i++) {
    const matchCount = numsMap.get(k - nums[i]) || 0;
    if (matchCount > 0) {
      count++;
      numsMap.set(k - nums[i], matchCount - 1);
    }
    else {
      numsMap.set(nums[i], (numsMap.get(nums[i]) || 0) + 1);
    }
  }
  return count;
};
// @lc code=end



// @lcpr case=start
// [1,2,3,4]\n5\n
// @lcpr case=end

// @lcpr case=start
// [3,1,3,4,3]\n6\n
// @lcpr case=end

// @lcpr case=start
// [3]\n3\n
// @lcpr case=end

// @lcpr case=start
// [3,3,3,1,2,5,3,6,7,5,5]\n8\n
// @lcpr case=end
