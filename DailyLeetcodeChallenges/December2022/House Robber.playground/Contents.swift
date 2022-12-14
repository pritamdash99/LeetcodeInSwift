/*
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

 Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

  

 Example 1:

 Input: nums = [1,2,3,1]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
 Total amount you can rob = 1 + 3 = 4.

 Example 2:

 Input: nums = [2,7,9,3,1]
 Output: 12
 Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
 Total amount you can rob = 2 + 9 + 1 = 12.

 Constraints:

     1 <= nums.length <= 100
     0 <= nums[i] <= 400

 */
import Foundation

class Solution {
    func rob(_ nums: [Int]) -> Int {
        var rob1 = 0
        var rob2 = 0

        for num in nums {
            let temp = max(num + rob1, rob2)
            rob1 = rob2
            rob2 = temp
        }
        return rob2
    }
}

//faster solution
class Solution2 {
    func rob(_ nums: [Int]) -> Int {
        if nums.endIndex == 0 {
            return 0
        }
        if nums.endIndex == 1 {
            return nums[0]
        }
        if nums.endIndex == 2 {
            return max(nums[0],nums[1])
        }
        var dp0 = nums[0]
        var dp1 = nums[1]
        var dp2 = nums[2] + nums[0]
        
        for i in 3..<nums.endIndex {
            let curr = max(dp0,dp1) + nums[i]
            dp0 = dp1
            dp1 = dp2
            dp2 = curr
            
        }
        
        return max(dp1, dp2)
    }
}

//another faster solution
class Solution3 {
    var calculated: [Int: Int] = [0:0]

    func rob(_ nums: [Int]) -> Int {
        calculated[1] = nums[0]

        let count = nums.count

        return rob(nums, count)
    }

    private func rob(_ nums: [Int], _ n: Int) -> Int {
        if let r = calculated[n] {
            return r
        }
        let r = max(rob(nums, n - 2) + nums[n - 1], rob(nums, n - 1))
        calculated[n] = r
        return r
    }
}
