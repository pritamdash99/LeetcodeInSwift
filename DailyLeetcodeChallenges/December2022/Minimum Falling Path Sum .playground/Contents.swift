/*
 931. Minimum Falling Path Sum

 Given an n x n array of integers matrix, return the minimum sum of any falling path through matrix.

 A falling path starts at any element in the first row and chooses the element in the next row that is either directly below or diagonally left/right. Specifically, the next element from position (row, col) will be (row + 1, col - 1), (row + 1, col), or (row + 1, col + 1).
 
 Example 1 :
 
 Input: matrix = [[2,1,3],[6,5,4],[7,8,9]]
 Output: 13
 Explanation: There are two falling paths with a minimum sum as shown.
 
 Example 2 :
 
 Input: matrix = [[-19,57],[-40,-5]]
 Output: -59
 Explanation: The falling path with a minimum sum is shown.
 
 Constraints:

     n == matrix.length == matrix[i].length
     1 <= n <= 100
     -100 <= matrix[i][j] <= 100

 
 */
import Foundation
//O(n^2)
class Solution {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        var dp = matrix
        
        for i in 1..<dp.count {
            for j in 0..<dp[i].count {
                
                let val1 = dp[i - 1][j]
                let val2 = dp[i - 1][max(0, j - 1)]
                let val3 = dp[i - 1][min(j + 1, dp[i].count - 1)]
                
                dp[i][j] = min(val1, val2, val3) + dp[i][j]
            }
        }
        
        return dp.last?.min() ?? 0
    }
}

//faster solution - O(n)
class Solution2 {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        let rows = matrix.count
        let columns = matrix[0].count
        var memo = Array.init(repeating: Array.init(repeating: -1,count: columns),count: rows)

        func dfs(_ row:Int,_ col:Int)->Int {
            
            if col < 0 || col >= columns {
                return Int.max - 1000
            }
            
            if row == 0 {
                return matrix[row][col]
            }
              if memo[row][col] != -1 {
                return  memo[row][col]
            }
            let straight =  matrix[row][col] + dfs(row - 1 ,col)
            let leftDiagonal = matrix[row][col] + dfs(row - 1,col-1)
            let rightDiagonal = matrix[row][col] + dfs(row - 1,col+1)
            
            memo[row][col] =  min(straight,leftDiagonal,rightDiagonal)
            
            return memo[row][col]
            
        }
        
        var minPath = Int.max
        
        for col in 0..<columns {
            minPath = min(minPath,dfs(rows-1,col))
        }
        
        return minPath
        
    }
}


