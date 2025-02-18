/*
 * @lc app=leetcode.cn id=2080 lang=typescript
 * @lcpr version=30204
 *
 * [2080] 区间内查询数字的频率
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
class RangeFreqQuery {
    private numIndexes: Map<number, number[]> = new Map();

    constructor(arr: number[]) {
        for (let i = 0; i < arr.length; i++) {
            if (!this.numIndexes.has(arr[i])) {
                this.numIndexes.set(arr[i], []);
            }

            this.numIndexes.get(arr[i])?.push(i);
        }
    }

    query(left: number, right: number, value: number): number {
        if (!this.numIndexes.has(value)) return 0;

        const indexes = this.numIndexes.get(value)!;
        if (right < indexes[0] || left > indexes[indexes.length - 1]) return 0;

        const min = this.findMin(indexes, left);
        const max = this.findMax(indexes, right);

        return max - min + 1;
    }

    private findMin(indexes: number[], target: number): number {
        let l = 0, r = indexes.length - 1;
        while (l <= r) {
            const mid = l + Math.floor((r - l) / 2);
            if (indexes[mid] === target) return mid;
            if (indexes[mid] > target) {
                r = mid - 1;
            }
            else {
                l = mid + 1;
            }
        }
        return l;
    }

    private findMax(indexes: number[], target: number): number {
        let l = 0, r = indexes.length - 1;
        while (l <= r) {
            const mid = l + Math.floor((r - l) / 2);
            if (indexes[mid] === target) return mid;
            if (indexes[mid] > target) {
                r = mid - 1;
            }
            else {
                l = mid + 1;
            }
        }
        return r;
    }
}

/**
 * Your RangeFreqQuery object will be instantiated and called as such:
 * var obj = new RangeFreqQuery(arr)
 * var param_1 = obj.query(left,right,value)
 */
// @lc code=end



// @lcpr case=start
// ["RangeFreqQuery", "query", "query","query","query"]\n[[[12, 33, 4, 56, 22, 2, 34, 33, 22, 12, 34, 56]], [1, 2, 4], [0, 11, 33],[10,11,33],[0,11,109]]\n
// @lcpr case=end


