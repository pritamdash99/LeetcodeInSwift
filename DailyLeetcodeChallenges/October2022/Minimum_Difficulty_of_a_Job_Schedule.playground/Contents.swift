import Foundation

class Solution {
    func minDifficulty(_ jobDifficulty: [Int], _ d: Int) -> Int {
        if jobDifficulty.count < d { return -1 }
        var dp = Array(repeating: Array(repeating: -1, count: jobDifficulty.count), count: d+1)
        var startIndex = 0
        return dfs(jobDifficulty,&dp,d,&startIndex)
    }
    func dfs(_ jobDifficulty : [Int], _ dp : inout [[Int]], _ d : Int, _ index : inout Int) -> Int {
        if d == 1 {
            var maxi = 0
            while index < jobDifficulty.count{
                maxi = max(maxi,jobDifficulty[index])
                index += 1
            }
            return maxi
        }
        
        if dp[d][index] != -1 { return dp[d][index] }
        
        var leftMax = 0
        var res = Int.max
        for i in index..<jobDifficulty.count - d + 1 {
            leftMax = max(leftMax,jobDifficulty[i])
            var newIndex = i + 1
            let rightMax = dfs(jobDifficulty, &dp, d-1, &newIndex)
            res = min(res,leftMax+rightMax)
        }
        dp[d][index] = res
        return dp[d][index]
    }
}

