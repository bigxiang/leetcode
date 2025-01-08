/*
 * @lc app=leetcode.cn id=2241 lang=javascript
 * @lcpr version=30204
 *
 * [2241] 设计一个 ATM 机器
 */


// @lcpr-template-start

// @lcpr-template-end
// @lc code=start

var ATM = function() {
  this.banknotesCount = [0, 0, 0, 0, 0];
};

/**
 * @param {number[]} banknotesCount
 * @return {void}
 */
ATM.prototype.deposit = function(banknotesCount) {
  for (let i = 0; i < banknotesCount.length; i++) {
    this.banknotesCount[i] += banknotesCount[i];
  }
};

/**
 * @param {number} amount
 * @return {number[]}
 */
ATM.prototype.withdraw = function(amount) {
  const neededBanknotesCount = new Array(5).fill(0);

  while (amount > 0) {
    if (amount >= 500 && (this.banknotesCount[4] - neededBanknotesCount[4]) > 0) {
      let needed500Count = Math.min(Math.floor(amount / 500), this.banknotesCount[4]);
      neededBanknotesCount[4] += needed500Count;
      amount -= 500 * needed500Count;
    }
    else if (amount >= 200 && (this.banknotesCount[3] - neededBanknotesCount[3]) > 0) {
      let needed200Count = Math.min(Math.floor(amount / 200), this.banknotesCount[3]);
      neededBanknotesCount[3] += needed200Count;
      amount -= 200 * needed200Count;
    }
    else if (amount >= 100 && (this.banknotesCount[2] - neededBanknotesCount[2]) > 0) {
      let needed100Count = Math.min(Math.floor(amount / 100), this.banknotesCount[2]);
      neededBanknotesCount[2] += needed100Count;
      amount -= 100 * needed100Count;
    }
    else if (amount >= 50 && (this.banknotesCount[1] - neededBanknotesCount[1]) > 0) {
      let needed50Count = Math.min(Math.floor(amount / 50), this.banknotesCount[1]);
      neededBanknotesCount[1] += needed50Count;
      amount -= 50 * needed50Count;
    }
    else if (amount >= 20 && (this.banknotesCount[0] - neededBanknotesCount[0]) > 0) {
      let needed20Count = Math.min(Math.floor(amount / 20), this.banknotesCount[0]);
      neededBanknotesCount[0] += needed20Count;
      amount -= 20 * needed20Count;
    }
    else return [-1];
  }

  for (let i = 0; i < neededBanknotesCount.length; i++) {
    this.banknotesCount[i] -= neededBanknotesCount[i];
  }

  return neededBanknotesCount;
};

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
// ["ATM", "deposit", "withdraw", "deposit", "withdraw", "withdraw"]\n[[], [[0,2,0,0,1]], [100], [[0,1,0,1,1]], [600], [550]]\n
// @lcpr case=end

