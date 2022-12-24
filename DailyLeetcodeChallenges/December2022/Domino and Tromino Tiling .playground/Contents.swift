/*
 790. Domino and Tromino Tiling

 You have two types of tiles: a 2 x 1 domino shape and a tromino shape. You may rotate these shapes.
 
 Given an integer n, return the number of ways to tile an 2 x n board. Since the answer may be very large, return it modulo 109 + 7.

 In a tiling, every square must be covered by a tile. Two tilings are different if and only if there are two 4-directionally adjacent cells on the board such that exactly one of the tilings has both squares occupied by a tile.
 
 Example 1 :
 Input: n = 3
 Output: 5
 Explanation: The five different ways are show above.

 Example 2:

 Input: n = 1
 Output: 1
 
 Constraints:
     1 <= n <= 1000

 */
import Foundation

class Solution {
    func numTilings(_ n: Int) -> Int {
        if n < 3 { return n }
        let mod = 1_000_000_007
        var dp = [1,1,2]
        for i in 3...n {
            dp.append((dp[i-1] * 2 + dp[i-3]) % mod)
        }
        return dp[n]
    }
}
/*
 Approach

 This solution uses dynamic programming to solve the problem. The basic idea is to start from small cases and build up to the final solution.

 We use an array dp to store the number of ways to tile a board of size 2 x i. We start by setting dp[0] = 1, dp[1] = 1, and dp[2] = 2, because there is only 1 way to tile a board of size 2 x 0 (no tiles), 1 way to tile a board of size 2 x 1 (1 domino tile), and 2 ways to tile a board of size 2 x 2 (2 domino tiles or 1 tromino tile).

 Then, we iterate through i from 3 to n, and for each i, we calculate the number of ways to tile a board of size 2 x i by adding the number of ways to tile a board of size 2 x (i - 1) (1 domino tile), the number of ways to tile a board of size 2 x (i - 2) (1 tromino tile), and the number of ways to tile a board of size 2 x (i - 3) (2 domino tiles). We store the result in dp[i] and return dp[n] as the final answer.
 Complexity

     Time complexity:
     O(n)O(n)O(n) since we only need to iterate through n once to calculate the result.

 */
