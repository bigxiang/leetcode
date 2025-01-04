/*
 * @lc app=leetcode.cn id=2462 lang=javascript
 * @lcpr version=30204
 *
 * [2462] 雇佣 K 位工人的总代价
 */

// @lc code=start
/**
 * @param {number[]} costs
 * @param {number} k
 * @param {number} candidates
 * @return {number}
 */
var totalCost = function(costs, k, candidates) {
  const leftHeap = new Heap((a, b) => a > b);
  const rightHeap = new Heap((a, b) => a > b);
  let sum = 0;

  let left = candidates - 1;
  for (let i = 0; i <= left; i++) {
    leftHeap.add(costs[i]);
  }
  let right = Math.max(costs.length - candidates, left + 1);
  for (let i = costs.length - 1; i >= right; i--) {
    rightHeap.add(costs[i]);
  }

  for (let i = 0; i < k; i++) {
    const leftTop = leftHeap.top() || Number.MAX_SAFE_INTEGER;
    const rightTop = rightHeap.top() || Number.MAX_SAFE_INTEGER;

    if (leftTop <= rightTop) {
      cost = leftHeap.pop();
      sum += cost;

      left++;
      if (left < right) leftHeap.add(costs[left]);
    }
    else if (leftTop > rightTop) {
      cost = rightHeap.pop();
      sum += cost;

      right--;
      if (right > left) rightHeap.add(costs[right]);
    }
  }

  return sum;
};

class Heap {
  constructor(comFn) {
    this.data = [0];
    this.comFn = comFn;
  }

  top() {
    return this.data[1];
  }

  add(val) {
    this.data.push(val);
    this.heapifyUp(this.data.length - 1);
  }

  heapifyUp(index) {
    if (index === 1) return;

    const parentIndex = index >> 1;
    if (this.comFn(this.data[parentIndex], this.data[index])) {
      [this.data[parentIndex], this.data[index]] = [this.data[index], this.data[parentIndex]];
      this.heapifyUp(parentIndex);
    }
  }

  pop() {
    if (this.data.length === 1) return;

    if (this.data.length === 2) {
      return this.data.pop();
    }

    const popped = this.data[1];
    this.data[1] = this.data.pop();
    this.heapifyDown(1);

    return popped;
  }

  heapifyDown(index) {
    const leftIndex = index << 1;
    const rightIndex = leftIndex + 1;
    let targetIndex = index;

    if (leftIndex < this.data.length && this.comFn(this.data[targetIndex], this.data[leftIndex])) {
      targetIndex = leftIndex;
    }

    if (rightIndex < this.data.length && this.comFn(this.data[targetIndex], this.data[rightIndex])) {
      targetIndex = rightIndex;
    }

    if (targetIndex !== index) {
      [this.data[targetIndex], this.data[index]] = [this.data[index], this.data[targetIndex]];
      this.heapifyDown(targetIndex);
    }
  }
}
// @lc code=end



// @lcpr case=start
// [17,12,10,2,7,2,11,20,8]\n3\n4\n
// @lcpr case=end

// @lcpr case=start
// [1,2,4,1]\n3\n3\n
// @lcpr case=end

// @lcpr case=start
// [1,2,4,1]\n2\n4\n
// @lcpr case=end
