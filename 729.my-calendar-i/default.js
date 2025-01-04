/*
 * @lc app=leetcode.cn id=729 lang=javascript
 * @lcpr version=30204
 *
 * [729] 我的日程安排表 I
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start

var MyCalendar = function() {
  this.scheduledTimes = [];
};

/**
 * @param {number} startTime
 * @param {number} endTime
 * @return {boolean}
 */
MyCalendar.prototype.book = function(startTime, endTime) {
  if (this.scheduledTimes.length === 0) {
    this.scheduledTimes.push([startTime, endTime]);
    return true;
  }

  if (endTime <= this.scheduledTimes[0][0]) {
    this.scheduledTimes.unshift([startTime, endTime]);
    return true;
  }

  if (startTime >= this.scheduledTimes[this.scheduledTimes.length - 1][1]) {
    this.scheduledTimes.push([startTime, endTime]);
    return true;
  }

  const newScheduledTimes = [];
  let scheduled = false;
  for (let i = 0; i < this.scheduledTimes.length; i++) {
    if (scheduled) {
      newScheduledTimes.push(this.scheduledTimes[i]);
      continue;
    }

    if (startTime >= this.scheduledTimes[i][1]) {
      newScheduledTimes.push(this.scheduledTimes[i]);
      continue;
    }

    if (endTime <= this.scheduledTimes[i][0]) {
      newScheduledTimes.push([startTime, endTime]);
      newScheduledTimes.push(this.scheduledTimes[i]);
      scheduled = true;
      continue;
    }

    return false;
  }

  this.scheduledTimes = newScheduledTimes;
  return true;
};

/**
 * Your MyCalendar object will be instantiated and called as such:
 * var obj = new MyCalendar()
 * var param_1 = obj.book(startTime,endTime)
 */
// @lc code=end



// @lcpr case=start
// ["MyCalendar", "book", "book", "book"]\n[[], [10, 20], [15, 25], [20, 30]]\n
// @lcpr case=end


