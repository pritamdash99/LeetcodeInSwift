/*
 79. Word Search

 Given an m x n grid of characters board and a string word, return true if word exists in the grid.

 The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.
 
 Example 1 :
 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
 Output: true
 
 Example 2 :
 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
 Output: true
 
 Example 3 :
 Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
 Output: false

 Constraints:

     m == board.length
     n = board[i].length
     1 <= m, n <= 6
     1 <= word.length <= 15
     board and word consists of only lowercase and uppercase English letters.

 */
import Foundation

class Solution {
    class Trie {
        var dict = [Character: Trie]()
        var isEnd = false
    }
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        let root = Trie()
        var curr = root
        for char in word {
            if curr.dict[char] == nil {
                curr.dict[char] = Trie()
            }
            curr = curr.dict[char]!
        }
        curr.isEnd = true

        let rows = board.endIndex, cols = board[0].endIndex

        func search(_ node: Trie, _ x: Int, _ y: Int) -> Bool {
            if node.isEnd {return true}
            guard x>=0, x<rows, y>=0, y<cols else {return false}
            
            let temp = board[x][y]
            board[x][y] = "."
            var res = false
            if let next = node.dict[temp] {
                let top = search(next, x+1, y)
                let bottom = search(next, x-1, y)
                let left = search(next, x, y+1)
                let right = search(next, x, y-1)
                res = res || top || bottom || left || right
            }
            board[x][y] = temp
            return res
        }

        for row in 0..<rows {
            for col in 0..<cols {
                if search(root, row, col) == true {
                    return true
                }
            }
        }

        return false
    }
}

