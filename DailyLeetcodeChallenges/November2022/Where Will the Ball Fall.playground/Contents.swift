import Foundation
/*
 1706. Where Will the Ball Fall
 You have a 2-D grid of size m x n representing a box, and you have n balls. The box is open on the top and bottom sides.

 Each cell in the box has a diagonal board spanning two corners of the cell that can redirect a ball to the right or to the left.

    1. A board that redirects the ball to the right spans the top-left corner to the bottom-right corner and is represented in the grid as 1.
    2. A board that redirects the ball to the left spans the top-right corner to the bottom-left corner and is represented in the grid as -1.

 We drop one ball at the top of each column of the box. Each ball can get stuck in the box or fall out of the bottom. A ball gets stuck if it hits a "V" shaped pattern between two boards or if a board redirects the ball into either wall of the box.

 Return an array answer of size n where answer[i] is the column that the ball falls out of at the bottom after dropping the ball from the ith column at the top, or -1 if the ball gets stuck in the box.
 */
//fast solution
class Solution {
    func findBall(_ grid: [[Int]]) -> [Int] {
        var res = [Int]()
        let rows = grid.endIndex, cols = grid[0].endIndex
        next: for i in 0..<cols {
            var currRow = 0, currCol = i
            while currRow < rows {
                if grid[currRow][currCol] == 1 {
                    guard currCol + 1 < cols else {
                        res.append(-1)
                        continue next
                    }
                    if grid[currRow][currCol+1] == 1 {
                        currRow += 1
                        currCol += 1
                    } else {
                        res.append(-1)
                        continue next
                    }
                } else {
                    guard currCol-1 >= 0 else {
                        res.append(-1)
                        continue next
                    }
                    if grid[currRow][currCol-1] == -1 {
                        currRow += 1
                        currCol -= 1
                    } else {
                        res.append(-1)
                        continue next
                    }
                }
            }
            res.append(currCol)
        }
        return res
    }
}

//faster solution
class Solution2 {
    func findBall(_ grid: [[Int]]) -> [Int] {
            let cols = grid[0].endIndex
            var result = [Int]()
            for j in 0..<cols{
                result.append(dfs(0, j, grid))
            }
            return result
        }
    
    func dfs(_ i :Int, _ j : Int, _ grid : [[Int]]) -> Int{
        if i >= grid.endIndex { return j }
        if grid[i][j] == 1 && j+1 < grid[0].endIndex && grid[i][j+1] == 1 {
            return dfs(i+1, j+1, grid)
        }else if grid[i][j] == -1 && j-1 >= 0 && grid[i][j-1] == -1{
            return dfs(i+1, j-1, grid)
        }else if grid[i][j] == 1 && j+1 >= grid[0].endIndex{
            return -1
        }else{
            return -1
        }
    }
}
