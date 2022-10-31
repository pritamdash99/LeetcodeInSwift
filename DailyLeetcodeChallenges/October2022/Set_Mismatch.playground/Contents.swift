import Foundation

class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
            var cand: Set<Int> = []
            var missing = -1
            var sum = (1 + nums.count) * nums.count / 2
            for x in nums {
                if cand.contains(x) == false{
                    cand.insert(x)
                    sum -= x
                } else {
                    missing = x
                }
            }
            return [missing, sum]
        }
}

let x = Solution()
print(x.findErrorNums([2,3,3]))

//1 more solution
func findErrorNums(_ nums: [Int]) -> [Int] {
        let sortedNums = nums.sorted()
        var sum = 0
        var sum2 = 0
        var preNum = 0
        var repeatNum = 0
        
        for index in 0 ..< sortedNums.count {
            sum += index + 1
            sum2 += sortedNums[index]
            if preNum == sortedNums[index] {
                repeatNum = sortedNums[index]
            }
            preNum = sortedNums[index]
        }
        return [repeatNum, repeatNum + sum - sum2]
    }
