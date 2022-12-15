/*
 1143. Longest Common Subsequence

 Given two strings text1 and text2, return the length of their longest common subsequence. If there is no common subsequence, return 0.

 A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.

     For example, "ace" is a subsequence of "abcde".

 A common subsequence of two strings is a subsequence that is common to both strings.

 Example 1:

 Input: text1 = "abcde", text2 = "ace"
 Output: 3
 Explanation: The longest common subsequence is "ace" and its length is 3.

 Example 2:

 Input: text1 = "abc", text2 = "abc"
 Output: 3
 Explanation: The longest common subsequence is "abc" and its length is 3.

 Example 3:

 Input: text1 = "abc", text2 = "def"
 Output: 0
 Explanation: There is no such common subsequence, so the result is 0.

 Constraints:

     1 <= text1.length, text2.length <= 1000
     text1 and text2 consist of only lowercase English characters.


 */
import Foundation

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var dp = [[Int]](repeating: [Int](repeating: 0,count: text2.count+1), count: text1.count+1)
        let arr1 = Array(text1), arr2 = Array(text2)
        for i in 0..<arr1.endIndex {
            for j in 0..<arr2.endIndex {
                if arr1[i] == arr2[j] {
                    dp[i+1][j+1] = dp[i][j]+1
                } else {
                    dp[i+1][j+1] = max(dp[i+1][j],dp[i][j+1])
                }
                
            }
        }
        return dp[arr1.endIndex][arr2.endIndex]
    }
}

//another solution
// Approach 2: Improved Memoization (top-down DP)
// Much more elefant solutions as for me to understand it :-)

// TIME: O(M*N)
// Space: O(M*N)

class Solution2 {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {

        let text1: [Character] = Array(text1)
        let text2: [Character] = Array(text2)

        // Make a grid of 0's with text2.length() + 1 columns
        // and text1.length() + 1 rows.
        var dpGrid = [[Int]](repeating: [Int](repeating: 0, count: text2.count + 1), count: text1.count + 1)
          
        // Iterate up each column, starting from the last one.
        for col in stride(from: text2.count - 1, through: 0, by: -1) {
            for row in stride(from: text1.count - 1, through: 0, by: -1) {
                // If the corresponding characters for this cell are the same...
                if text1[row] == text2[col] {
                    dpGrid[row][col] = 1 + dpGrid[row + 1][col + 1]

                // Otherwise they must be different...
                } else {
                    dpGrid[row][col] = max(dpGrid[row + 1][col], dpGrid[row][col + 1])
                }
            }
        }

        // The original problem's answer is in dp_grid[0][0]. Return it.
        // print("---")
        // print(dpGrid[0])
        // print(dpGrid[1])
        // print(dpGrid[2])
        // print(dpGrid[3])
        // print(dpGrid[4])
        // print(dpGrid[5])
        return dpGrid[0][0]
    }
}

