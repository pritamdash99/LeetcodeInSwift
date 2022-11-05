import Foundation

//Faster aproach using trie and dfs
class Trie {
    var dict = [Character: Trie]()
    var word: String?
}

class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        var board = board
        let root = Trie()
        for word in words {
            var curr = root
            for char in word {
                if curr.dict[char] == nil {
                    curr.dict[char] = Trie()
                }
                curr = curr.dict[char]!
            }
            curr.word = word
        }

        var res = [String]()
        let rows = board.endIndex, cols = board[0].endIndex

        func dfs(_ x: Int, _ y: Int, _ node: Trie) {
            guard x>=0, x<rows, y>=0, y<cols else {return}
            let char = board[x][y]
            guard let next = node.dict[char] else { return }
            if let word = next.word {
                res.append(word)
                next.word = nil
            }

            board[x][y] = "_"
            
            dfs(x+1,y,next)
            dfs(x-1,y,next)
            dfs(x,y+1,next)
            dfs(x,y-1,next)
            
            board[x][y] = char
            if next.dict.isEmpty {
                node.dict[char] = nil
            }
        }

        
        for i in 0..<rows {
            for j in 0..<cols {
                dfs(i,j, root)
            }
        }
        return res
    }
}
