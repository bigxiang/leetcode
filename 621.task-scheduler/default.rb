#
# @lc app=leetcode id=621 lang=ruby
#
# [621] Task Scheduler
#

# @lc code=start
# @param {Character[]} tasks
# @param {Integer} n
# @return {Integer}
def least_interval(tasks, n)
  task_count = Array.new(26, 0)
  tasks.each do |t|
    task_count[t.ord - 'A'.ord] += 1
  end

  task_count = task_count.sort
  max_count = task_count[-1]
  idle_time = (max_count - 1) * n

  (task_count.size-2).downto(0) do |i|
    break if idle_time <= 0

    idle_time -= [max_count - 1, task_count[i]].min
  end
  idle_time = [0, idle_time].max

  idle_time + tasks.size
end
# @lc code=end

puts least_interval(
  ["A","A","A","B","B","B"],
  0
)

puts least_interval(
  ["A","B","C","D","A","B","V"],
  3
)
