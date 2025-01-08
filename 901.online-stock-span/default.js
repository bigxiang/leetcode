/*
 * @lc app=leetcode.cn id=901 lang=javascript
 * @lcpr version=30204
 *
 * [901] 股票价格跨度
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start

var StockSpanner = function() {
  this.stack = [];
};

/**
 * @param {number} price
 * @return {number}
 */
StockSpanner.prototype.next = function(price) {
  if (this.stack.length === 0 || this.stack[this.stack.length - 1] > price) {
    this.stack.push([price, 1]);
  }
  else {
    let count = 1;
    while (this.stack.length > 0 && this.stack[this.stack.length - 1][0] <= price) {
      count += this.stack.pop()[1];
    }
    this.stack.push([price, count]);
  }

  return this.stack[this.stack.length - 1][1];
};

/**
 * Your StockSpanner object will be instantiated and called as such:
 * var obj = new StockSpanner()
 * var param_1 = obj.next(price)
 */
// @lc code=end



// @lcpr case=start
// ["StockSpanner", "next", "next", "next", "next", "next", "next", "next"]\n[[], [100], [80], [60], [70], [60], [75], [85]]\n
// @lcpr case=end


