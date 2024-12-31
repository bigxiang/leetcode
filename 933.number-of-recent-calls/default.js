/*
 * @lc app=leetcode.cn id=933 lang=javascript
 * @lcpr version=30204
 *
 * [933] 最近的请求次数
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start

var RecentCounter = function() {
  this.queue = [];
};

/**
 * @param {number} t
 * @return {number}
 */
RecentCounter.prototype.ping = function(t) {
  this.queue.push(t);
  while (this.queue[0] < t - 3000) {
    this.queue.shift();
  }

  return this.queue.length;
};

/**
 * Your RecentCounter object will be instantiated and called as such:
 * var obj = new RecentCounter()
 * var param_1 = obj.ping(t)
 */
// @lc code=end



// @lcpr case=start
// ["RecentCounter", "ping", "ping", "ping", "ping"]\n[[], [1], [100], [3001], [3002]]\n
// @lcpr case=end


