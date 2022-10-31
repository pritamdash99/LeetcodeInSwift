import Foundation

class Solution {
    func largestOverlap(_ img1: [[Int]], _ img2: [[Int]]) -> Int {
        let n = img1.count
        var count = Array(repeating: Array(repeating: 0, count: 2 * n + 1), count:  2 * n + 1)
        var ans = 0
        for i in 0..<n{
            for j in 0..<n{
                if img1[i][j] == 1 {
                    for i2 in 0..<n{
                        for j2 in 0..<n{
                            if img2[i2][j2] == 1{
                                count[i - i2 + n][j - j2 + n] += 1
                            }
                        }
                    }
                }
            }
        }
        for row in count{
            for v in row{
                ans = max(ans,v)
            }
        }
        
        return ans
    }
}
