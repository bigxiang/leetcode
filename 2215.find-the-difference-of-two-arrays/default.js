/*
 * @lc app=leetcode.cn id=2215 lang=javascript
 * @lcpr version=30204
 *
 * [2215] 找出两数组的不同
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number[][]}
 */
var findDifference = function(nums1, nums2) {
  const nums1Set = new Set(nums1);
  const nums2Set = new Set(nums2);

  return [
    Array.from(nums1Set).filter((n) => !nums2Set.has(n)),
    Array.from(nums2Set).filter((n) => !nums1Set.has(n))
  ]
};
// @lc code=end



// @lcpr case=start
// [1,2,3]\n[2,4,6]\n
// @lcpr case=end

// @lcpr case=start
// [1,2,3,3]\n[1,1,2,2]\n
// @lcpr case=end

// @lcpr case=start
// [1]\n[1]\n
// @lcpr case=end


