/*
 * @lc app=leetcode.cn id=2300 lang=javascript
 * @lcpr version=30204
 *
 * [2300] 咒语和药水的成功对数
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} spells
 * @param {number[]} potions
 * @param {number} success
 * @return {number[]}
 */
var successfulPairs = function(spells, potions, success) {
  const res = [];
  potions.sort((a, b) => a - b);
  for (const spell of spells) {
    res.push(successfulPair(spell, potions, success));
  }
  return res;
};

var successfulPair = function(spell, potions, success) {
  left = 0;
  right = potions.length - 1;
  while (left <= right) {
    const mid = left + ((right - left) >> 1);
    if (potions[mid] * spell >= success) {
      right = mid - 1;
    }
    else left = mid + 1;
  }

  return potions.length - left;
}
// @lc code=end



// @lcpr case=start
// [5,1,3]\n[1,2,3,4,5]\n7\n
// @lcpr case=end

// @lcpr case=start
// [3,1,2]\n[8,5,8]\n16\n
// @lcpr case=end


