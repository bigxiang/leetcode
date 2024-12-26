/*
 * @lc app=leetcode.cn id=217 lang=javascript
 * @lcpr version=30204
 *
 * [217] 存在重复元素
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums
 * @return {boolean}
 */
var containsDuplicate = function(nums) {
  const numsSet = new Set();
  for (const num of nums) {
    if (numsSet.has(num)) return true;
    numsSet.add(num);
  }
  return false;
};
// @lc code=end



/*
// @lcpr case=start
// [1,2,3,1]\n
// @lcpr case=end

// @lcpr case=start
// [1,2,3,4]\n
// @lcpr case=end

// @lcpr case=start
// [1,1,1,3,3,4,3,2,4,2]\n
// @lcpr case=end

 */
