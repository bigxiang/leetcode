/*
 * @lc app=leetcode.cn id=1431 lang=javascript
 * @lcpr version=30204
 *
 * [1431] 拥有最多糖果的孩子
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} candies
 * @param {number} extraCandies
 * @return {boolean[]}
 */
var kidsWithCandies = function(candies, extraCandies) {
  const max = Math.max(...candies);
  return candies.map(candy => candy + extraCandies >= max);
};
// @lc code=end



// @lcpr case=start
// [2,3,5,1,3]\n3\n
// @lcpr case=end

// @lcpr case=start
// [4,2,1,1,2]\n1\n
// @lcpr case=end

// @lcpr case=start
// [12,1,12]\n10\n
// @lcpr case=end


