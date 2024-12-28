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
  const numsIndexMap = new Map();
  for (let i = 0; i < nums.length; i++) {
    if (numsIndexMap.has(nums[i])) numsIndexMap.get(nums[i]).push(i);
    else numsIndexMap.set(nums[i], [i]);
  }

  if (!numsIndexMap.has(x)) return new Array(queries.length).fill(-1);

  const result = [];
  for (let i = 0; i < queries.length; i++) {
    const numIndexes = numsIndexMap.get(x);
    if (queries[i] - 1 >= numIndexes.length) result.push(-1);
    else result.push(numIndexes[queries[i] - 1]);
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
