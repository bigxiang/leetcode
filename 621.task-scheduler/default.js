/*
 * @lc app=leetcode.cn id=621 lang=javascript
 * @lcpr version=30204
 *
 * [621] 任务调度器
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
/**
 * @param {character[]} tasks
 * @param {number} n
 * @return {number}
 */
var leastInterval = function(tasks, n) {
  const pq = new Heap((a, b) => a.nextTime > b.nextTime || a.nextTime === b.nextTime && a.count < b.count);
  const taskCount = new Array(26).fill(0);
  for (const task of tasks) {
    taskCount[task.charCodeAt() - 'A'.charCodeAt()]++;
  }
  taskCount.sort((a, b) => b - a).filter(c => c > 0).forEach((c, i) => pq.push({ count: c, nextTime: i }));
  let time = 0;
  while (pq.top()) {
    while (pq.top().nextTime < time) {
      const nextTask = pq.pop();
      nextTask.nextTime = time;
      pq.push(nextTask);
    }

    const nextTask = pq.pop();
    if (nextTask.nextTime > time) {
      time = nextTask.nextTime + 1;
    }
    else time++;

    nextTask.count--;
    if (nextTask.count !== 0) {
      nextTask.nextTime = time + n;
      pq.push(nextTask);
    }
  }
  return time;
};

class Heap {
  constructor(comFn) {
    this.data = [0];
    this.comFn = comFn;
  }

  top() {
    return this.data[1];
  }

  push(val) {
    this.data.push(val);
    this.heapifyUp(this.data.length - 1);
  }

  heapifyUp(index) {
    if (index === 1) return;

    const parentIndex = Math.floor(index / 2);
    if (this.comFn(this.data[parentIndex], this.data[index])) {
      [this.data[index], this.data[parentIndex]] = [this.data[parentIndex], this.data[index]];
      this.heapifyUp(parentIndex);
    }
  }

  pop() {
    if (this.data.length === 1) return;
    if (this.data.length === 2) return this.data.pop();

    const popped = this.data[1];
    this.data[1] = this.data.pop();
    this.heapifyDown(1);
    return popped;
  }

  heapifyDown(index) {
    const leftIndex = index * 2;
    const rightIndex = index * 2 + 1;

    if (leftIndex >= this.data.length) return;

    let targetIndex = index;
    if (this.comFn(this.data[targetIndex], this.data[leftIndex])) {
      targetIndex = leftIndex;
    }

    if (rightIndex < this.data.length && this.comFn(this.data[targetIndex], this.data[rightIndex])) {
      targetIndex = rightIndex;
    }

    if (targetIndex === index) return;

    [this.data[index], this.data[targetIndex]] = [this.data[targetIndex], this.data[index]];
    this.heapifyDown(targetIndex);
  }
}
// @lc code=end



// @lcpr case=start
// ["A","A","A","B","B","B"]\n2\n
// @lcpr case=end

// @lcpr case=start
// ["A","C","A","B","D","B"]\n1\n
// @lcpr case=end

// @lcpr case=start
// ["A","A","A","B","B","B"]\n3\n
// @lcpr case=end

// @lcpr case=start
// ["A"]\n3\n
// @lcpr case=end

// @lcpr case=start
// ["B","C","D","A","A","A","A","G"]\n1\n
// @lcpr case=end

// @lcpr case=start
// ["A","A","A","A","A","A","B","C","D","E","F","G"]\n1\n
// @lcpr case=end
