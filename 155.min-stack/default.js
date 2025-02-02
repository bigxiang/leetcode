/*
 * @lc app=leetcode.cn id=155 lang=javascript
 * @lcpr version=30204
 *
 * [155] 最小栈
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start

var MinStack = function() {
  this.data = [];
};

/**
 * @param {number} val
 * @return {void}
 */
MinStack.prototype.push = function(val) {
  if (this.data.length === 0) this.data.push({val, min: val});
  else this.data.push({val, min: Math.min(this.data[this.data.length - 1].min, val)});
};

/**
 * @return {void}
 */
MinStack.prototype.pop = function() {
  this.data.pop();
};

/**
 * @return {number}
 */
MinStack.prototype.top = function() {
  if (this.data.length === 0) return null;

  return this.data[this.data.length - 1].val;
};

/**
 * @return {number}
 */
MinStack.prototype.getMin = function() {
  if (this.data.length === 0) return null;

  return this.data[this.data.length - 1].min;
};

/**
 * Your MinStack object will be instantiated and called as such:
 * var obj = new MinStack()
 * obj.push(val)
 * obj.pop()
 * var param_3 = obj.top()
 * var param_4 = obj.getMin()
 */
// @lc code=end



// @lcpr case=start
// ["MinStack","push","push","push","getMin","pop","top","getMin"]\n[[],[-2],[0],[-3],[],[],[],[]]\n
// @lcpr case=end


