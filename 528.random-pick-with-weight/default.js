/*
 * @lc app=leetcode.cn id=528 lang=javascript
 * @lcpr version=30204
 *
 * [528] 按权重随机选择
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {number[]} w
 */
var Solution = function(w) {
  this.data = [];

  let pre = 0;
  for (let i = 0; i < w.length; i++) {
    pre += w[i];
    this.data.push(pre);
  }
};

/**
 * @return {number}
 */
Solution.prototype.pickIndex = function() {
  const randomWeight = Math.ceil(this.data[this.data.length - 1] * Math.random());
  let left = 0, right = this.data.length - 1;
  while (left < right) {
    const mid = left + ((right - left) >> 1);
    if (this.data[mid] === randomWeight) return mid;

    if (this.data[mid] > randomWeight) right = mid;
    else left = mid + 1;
  }
  return left;
};

/**
 * Your Solution object will be instantiated and called as such:
 * var obj = new Solution(w)
 * var param_1 = obj.pickIndex()
 */
// @lc code=end



// @lcpr case=start
// ["Solution","pickIndex"]\n[[[1]],[]]\n
// @lcpr case=end

// @lcpr case=start
// ["Solution","pickIndex","pickIndex","pickIndex","pickIndex","pickIndex","pickIndex","pickIndex","pickIndex"]\n[[[1,6,3]],[],[],[],[],[],[],[],[]]\n
// @lcpr case=end


