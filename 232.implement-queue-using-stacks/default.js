/*
 * @lc app=leetcode.cn id=232 lang=javascript
 * @lcpr version=30204
 *
 * [232] 用栈实现队列
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start

var MyQueue = function() {
  this.stack1 = [];
  this.stack2 = [];
};

/**
 * @param {number} x
 * @return {void}
 */
MyQueue.prototype.push = function(x) {
  while (this.stack2.length > 0) {
    this.stack1.push(this.stack2.pop());
  }

  this.stack1.push(x);
};

/**
 * @return {number}
 */
MyQueue.prototype.pop = function() {
  while (this.stack1.length > 0) {
    this.stack2.push(this.stack1.pop());
  }

  return this.stack2.pop();
};

/**
 * @return {number}
 */
MyQueue.prototype.peek = function() {
  return this.stack1[0] || this.stack2[this.stack2.length - 1];
};

/**
 * @return {boolean}
 */
MyQueue.prototype.empty = function() {
  return this.stack1.length === 0 && this.stack2.length === 0;
};

/**
 * Your MyQueue object will be instantiated and called as such:
 * var obj = new MyQueue()
 * obj.push(x)
 * var param_2 = obj.pop()
 * var param_3 = obj.peek()
 * var param_4 = obj.empty()
 */
// @lc code=end



// @lcpr case=start
// ["MyQueue", "push", "push", "peek", "pop", "empty"]\n[[], [1], [2], [], [], []]\n
// @lcpr case=end


// @lcpr case=start
// ["MyQueue", "push", "push", "pop", "peek", "empty"]\n[[], [1], [2], [], [], []]\n
// @lcpr case=end
