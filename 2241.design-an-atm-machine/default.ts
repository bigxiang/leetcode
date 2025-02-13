/*
 * @lc app=leetcode.cn id=2241 lang=typescript
 * @lcpr version=30204
 *
 * [2241] 设计一个 ATM 机器
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start
class ATM {
  private bankNotes: number[];
  private noteAmount: number[];

  constructor() {
    this.bankNotes = [0, 0, 0, 0, 0];
    this.noteAmount = [20, 50, 100, 200, 500];
  }

  deposit(banknotesCount: number[]): void {
    for (let i:number = 0; i < banknotesCount.length; i++) {
      this.bankNotes[i] += banknotesCount[i];
    }
  }

  withdraw(amount: number): number[] {
    const withdrawn: number[] = [0, 0, 0, 0, 0];
    const remaining: number[] = [...this.bankNotes];

    for (let i:number = this.noteAmount.length - 1; i >= 0; i--) {
      const notesCount = Math.min(Math.floor(amount / this.noteAmount[i]), remaining[i]);
      amount -= notesCount * this.noteAmount[i];
      withdrawn[i] += notesCount;
      remaining[i] -= notesCount;
    }

    if (amount > 0) return [-1];

    this.bankNotes = remaining;
    return withdrawn;
  }
}

/**
 * Your ATM object will be instantiated and called as such:
 * var obj = new ATM()
 * obj.deposit(banknotesCount)
 * var param_2 = obj.withdraw(amount)
 */
// @lc code=end



// @lcpr case=start
// ["ATM", "deposit", "withdraw", "deposit", "withdraw", "withdraw"]\n[[], [[0,0,1,2,1]], [600], [[0,1,0,1,1]], [600], [550]]\n
// @lcpr case=end

// @lcpr case=start
// ["ATM", "deposit", "withdraw", "deposit", "withdraw", "withdraw"]\n[[], [[0,0,2,2,0]], [600], [[0,1,1,1,1]], [600], [550]]\n
// @lcpr case=end
