from typing import List
#
# @lc app=leetcode.cn id=1 lang=python3
#
# [1] 两数之和
#

# @lc code=start
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        visited = {}
        for i, num in enumerate(nums):
            if target - num in visited:
                return [visited[target - num], i]
            visited[num] = i
# @lc code=end

