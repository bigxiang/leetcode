#
# @lc app=leetcode id=621 lang=ruby
#
# [621] Task Scheduler
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {Character[]} tasks
# @param {Integer} n
# @return {Integer}
def least_interval(tasks, n)
  task_count = tasks.group_by(&:itself).values.map(&:size).sort
  max = task_count.last
  max_count = task_count.count { |c| c == max }

  [(max - 1) * (n + 1) + max_count, tasks.size].max
end
# @lc code=end

# @lcpr case=start
# ["A","A","A","B","B","B"]\n2\n
# @lcpr case=end

# @lcpr case=start
# ["A","C","A","B","D","B"]\n1\n
# @lcpr case=end

# @lcpr case=start
# ["A","A","A","B","B","B"]\n3\n
# @lcpr case=end

# @lcpr case=start
# ["A"]\n3\n
# @lcpr case=end

# @lcpr case=start
# ["B","C","D","A","A","A","A","G"]\n1\n
# @lcpr case=end

# @lcpr case=start
# ["A","A","A","A","A","A","B","C","D","E","F","G"]\n1\n
# @lcpr case=end
