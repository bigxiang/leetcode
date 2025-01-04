/*
 * @lc app=leetcode.cn id=2336 lang=javascript
 * @lcpr version=30204
 *
 * [2336] 无限集中的最小数字
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start

var SmallestInfiniteSet = function() {
  this.removedNumSet = new Set();
  this.smallest = 1;
};

/**
 * @return {number}
 */
SmallestInfiniteSet.prototype.popSmallest = function() {
  const popedNum = this.smallest;
  this.removedNumSet.add(this.smallest++);
  while (this.removedNumSet.has(this.smallest)) {
    this.smallest++;
  }
  return popedNum;
};

/**
 * @param {number} num
 * @return {void}
 */
SmallestInfiniteSet.prototype.addBack = function(num) {
  this.removedNumSet.delete(num);
  if (num < this.smallest) {
    this.smallest = num;
  }
};

/**
 * Your SmallestInfiniteSet object will be instantiated and called as such:
 * var obj = new SmallestInfiniteSet()
 * var param_1 = obj.popSmallest()
 * obj.addBack(num)
 */
// @lc code=end



