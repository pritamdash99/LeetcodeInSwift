import Foundation

class Solution {
    private let direction : [[Int]] = [[0,1],[0,-1],[-1,0],[1,0]]
    func shortestPath(_ grid: [[Int]], _ k: Int) -> Int {
        let m = grid.count
        let n = grid.first?.count ?? 0
        
        if m == 0 || n == 0 { return 0 }
        //to store the minimum number of obstacles stored in each cell
        
        var obstacle = Array(repeating: Array(repeating: 0, count: n), count: m)
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        var queue : [[Int]] = []
        
        //x,y,obstacle count
        queue.append([0,0,grid[0][0]])
        obstacle[0][0] = grid[0][0]
        
        var level = 1
        while !queue.isEmpty{
            var size = queue.count
            while size > 0 {
                let head = queue.removeFirst()
                if head[0] == m - 1 && head[1] == n - 1 {
                    return level - 1
                }
                //head node this is obstacle count
                let currentObstacleCount = head[2]
                
                for d in direction{
                    let x = head[0] + d[0]
                    let y = head[1] + d[1]
                    
                    //within limits
                    if !(x >= 0 && y >= 0 && x < m && y < n) { continue }
                    let oldObstacleCount = obstacle[x][y]
                    let newObstacleCount = currentObstacleCount + grid[x][y]
                    
                    if ((!visited[x][y]) && newObstacleCount <= k){
                        queue.append([x,y,newObstacleCount])
                        obstacle[x][y] = newObstacleCount
                        visited[x][y] = true
                    }
                    
                    if ((oldObstacleCount > newObstacleCount) && newObstacleCount <= k){
                        queue.append([x,y,newObstacleCount])
                        obstacle[x][y] = newObstacleCount
                        visited[x][y] = true
                    }
                    
                }
                size -= 1
            }
            level += 1
        }
        return -1
    }
}

let x = Solution()
print(x.shortestPath([[0,0,0],[1,1,0],[0,0,0],[0,1,1],[0,0,0]], 1))


//Faster solution
class Solution2 {
    func shortestPath(_ grid: [[Int]], _ k: Int) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        let dir = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        var bfsQueue = [(0, 0, k)]
        var visited = Array(repeating: Array(repeating: -1, count: cols), count: rows)
        var step = 0
        while bfsQueue.isEmpty == false {
            var nextQueue = [(Int, Int, Int)]()
            for (currRow, currCol, currK) in bfsQueue {
                if currRow == rows - 1 && currCol == cols - 1 {
                    return step
                }
                for (dirRow, dirCol) in dir {
                    let nextRow = currRow + dirRow, nextCol = currCol + dirCol
                    
                    if nextRow < 0 || nextRow >= rows || nextCol < 0 || nextCol >= cols {
                        continue
                    }
                    
                    let nextK = currK - grid[nextRow][nextCol]
                    if nextK < 0 {
                        continue
                    }
                    
                    if nextK > visited[nextRow][nextCol] {
                        visited[nextRow][nextCol] = nextK
                        nextQueue.append((nextRow, nextCol, nextK))
                    }
                }
            }
            step += 1
            bfsQueue = nextQueue
        }
        return -1
    }
}
