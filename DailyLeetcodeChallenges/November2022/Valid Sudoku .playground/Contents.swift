/*
 36. Valid Sudoku

 Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

     Each row must contain the digits 1-9 without repetition.
     Each column must contain the digits 1-9 without repetition.
     Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.

 Note:

     A Sudoku board (partially filled) could be valid but is not necessarily solvable.
     Only the filled cells need to be validated according to the mentioned rules.

 Example 1 :
 
 Input: board =
 [["5","3",".",".","7",".",".",".","."]
 ,["6",".",".","1","9","5",".",".","."]
 ,[".","9","8",".",".",".",".","6","."]
 ,["8",".",".",".","6",".",".",".","3"]
 ,["4",".",".","8",".","3",".",".","1"]
 ,["7",".",".",".","2",".",".",".","6"]
 ,[".","6",".",".",".",".","2","8","."]
 ,[".",".",".","4","1","9",".",".","5"]
 ,[".",".",".",".","8",".",".","7","9"]]
 Output: true
 
 Example 2 :
 Example 2:

 Input: board =
 [["8","3",".",".","7",".",".",".","."]
 ,["6",".",".","1","9","5",".",".","."]
 ,[".","9","8",".",".",".",".","6","."]
 ,["8",".",".",".","6",".",".",".","3"]
 ,["4",".",".","8",".","3",".",".","1"]
 ,["7",".",".",".","2",".",".",".","6"]
 ,[".","6",".",".",".",".","2","8","."]
 ,[".",".",".","4","1","9",".",".","5"]
 ,[".",".",".",".","8",".",".","7","9"]]
 Output: false
 Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.

 Constraints:

     board.length == 9
     board[i].length == 9
     board[i][j] is a digit 1-9 or '.'.

 */
import Foundation

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        let len = 9
        var rowSet = Array(repeating: Set<Character>(), count: len)
        var colSet = Array(repeating: Set<Character>(), count: len)
        var boxSet = Array(repeating: Set<Character>(), count:len)

        for i in 0..<len {
            for j in 0..<len {

                let curentChar = board[i][j]
                if curentChar == "." {
                    continue
                }
               if !isValid(&rowSet[i], curentChar) {
                   return false
               }
               if !isValid(&colSet[j], curentChar) {
                   return false
               }
               let indx = 3 * (i/3) + (j/3)
               if !isValid(&boxSet[indx], curentChar) {
                   return false
               }
            }
        }
        return true
    }

    func isValid(_ set: inout Set<Character>, _ char: Character) -> Bool {
        if set.contains(char) {
            return false
        } else {
            set.insert(char)
            return true
        }
    }
}


