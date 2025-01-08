/*
 * @lc app=leetcode.cn id=732 lang=javascript
 * @lcpr version=30204
 *
 * [732] 我的日程安排表 III
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start

var MyCalendarThree = function() {
  this.data = new SegmentTree(0, 1e9);
};

/**
 * @param {number} startTime
 * @param {number} endTime
 * @return {number}
 */
MyCalendarThree.prototype.book = function(startTime, endTime) {
  return this.data.update(startTime, endTime - 1, 1);
};

class SegmentTree {
  constructor(start, end) {
    this.start = start;
    this.end = end;
    this.root = new Node();
  }

  update(l, r, val) {
    return this.root.update(this.root, this.start, this.end, l, r, val);
  }
}

class Node {
  constructor() {
    this.val = 0, this.lazy = 0;
    this.left = null, this.right = null;
  }

  update(node, start, end, l, r, val) {
    if (l <= start && end <= r) {
      node.val += val;
      node.lazy += val;
      return;
    }

    this.pushDown(node);

    const mid = start + ((end - start) >> 1);
    if (l <= mid) this.update(node.left, start, mid, l, r, val);
    if (mid < r) this.update(node.right, mid+1, end, l, r, val);

    this.pushUp(node);

    return node.val;
  }

  pushDown(node) {
    if (!node.left) node.left = new Node();
    if (!node.right) node.right = new Node();
    if (node.lazy === 0) return;

    node.left.val += node.lazy;
    node.left.lazy += node.lazy;

    node.right.val += node.lazy;
    node.right.lazy += node.lazy;

    node.lazy = 0;
  }

  pushUp(node) {
    node.val = Math.max(node.left.val, node.right.val);
  }
}

/**
 * Your MyCalendarThree object will be instantiated and called as such:
 * var obj = new MyCalendarThree()
 * var param_1 = obj.book(startTime,endTime)
 */
// @lc code=end



// @lcpr case=start
// ["MyCalendarThree", "book", "book", "book", "book", "book", "book"]\n[[], [10, 20], [50, 60], [10, 40], [5, 15], [5, 10], [25, 55]]\n
// @lcpr case=end


