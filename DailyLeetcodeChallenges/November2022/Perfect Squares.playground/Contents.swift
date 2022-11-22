/*
 279. Perfect Squares

 Given an integer n, return the least number of perfect square numbers that sum to n.

 A perfect square is an integer that is the square of an integer; in other words, it is the product of some integer with itself. For example, 1, 4, 9, and 16 are perfect squares while 3 and 11 are not.

 Example 1:

 Input: n = 12
 Output: 3
 Explanation: 12 = 4 + 4 + 4.

 Example 2:

 Input: n = 13
 Output: 2
 Explanation: 13 = 4 + 9.

 Constraints:
     1 <= n <= 10^4

 */
import Foundation
//fastest solution
class Solution {
    func numSquares(_ n: Int) -> Int {
        var n = n
        
        if isSquare(n) { return 1 }
        
        // Check whether n = a^2 + b^2
        let s = Int(sqrt(Double(n)))
        for i in 1...s {
            if isSquare(n - i*i) {
                return 2
            }
        }
        
        // The result is 4 if and only if n can be written in the
        // form of 4^k*(8*m + 7). Please refer to
        // Legendre's three-square theorem.
        while n % 4 == 0 {
            n /= 4
        }
        
        if n % 8 == 7 { return 4 }
        
        return 3
    }
    
    private func isSquare(_ int: Int) -> Bool {
        let s = Int(sqrt(Double(int)))
        
        return int - s * s == 0
    }
}

let x = Solution()
print(x.numSquares(12)) // 3

//Another solution

class Solution2 {
    func numSquares(_ n: Int) -> Int {
        var dp = Array(repeating: n, count: n + 1)
        dp[0] = 0

        for target in 1...n {
            for s in 1...target {
                let square = s * s
                if target - square < 0 {
                    break
                }
                dp[target] = min(dp[target], 1 + dp[target - square])
            }
        }

        return dp[n]
    }
}
