/*
 * @lc app=leetcode.cn id=3159 lang=javascript
 * @lcpr version=30204
 *
 * [3159] 查询数组中元素的出现位置
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @param {number[]} queries
 * @param {number} x
 * @return {number[]}
 */
var occurrencesOfElement = function(nums, queries, x) {
  const numIndexes = new Map();
  for (let i = 0; i < nums.length; i++) {
    if (!numIndexes.has(nums[i])) {
      numIndexes.set(nums[i], [i])
    }
    else {
      numIndexes.get(nums[i]).push(i);
    }
  }

  const result = [];
  for (let i = 0; i < queries.length; i++) {
    if (!numIndexes.has(x)) {
      result.push(-1);
    }
    else {
      const numIndexX = numIndexes.get(x);
      const index = queries[i] - 1;

      if (index >= numIndexX.length) {
        result.push(-1);
      }
      else {
        result.push(numIndexX[index]);
      }
    }
  }

  return result;
};
// @lc code=end



// @lcpr case=start
// [1,3,1,7]\n[1,3,2,4]\n1\n
// @lcpr case=end

// @lcpr case=start
// [1,2,3]\n[10]\n5\n
// @lcpr case=end

// @lcpr case=start
// [1]\n[10]\n1\n
// @lcpr case=end

// @lcpr case=start
// [1,2,3,1,2,3,1,2,3,1,2,3]\n[1,3,5,2,4,6]\n3\n
// @lcpr case=end
