/*
 947. Most Stones Removed with Same Row or Column
 On a 2D plane, we place n stones at some integer coordinate points. Each coordinate point may have at most one stone.

 A stone can be removed if it shares either the same row or the same column as another stone that has not been removed.

 Given an array stones of length n where stones[i] = [xi, yi] represents the location of the ith stone, return the largest possible number of stones that can be removed.

  

 Example 1:

 Input: stones = [[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]]
 Output: 5
 Explanation: One way to remove 5 stones is as follows:
 1. Remove stone [2,2] because it shares the same row as [2,1].
 2. Remove stone [2,1] because it shares the same column as [0,1].
 3. Remove stone [1,2] because it shares the same row as [1,0].
 4. Remove stone [1,0] because it shares the same column as [0,0].
 5. Remove stone [0,1] because it shares the same row as [0,0].
 Stone [0,0] cannot be removed since it does not share a row/column with another stone still on the plane.

 Example 2:

 Input: stones = [[0,0],[0,2],[1,1],[2,0],[2,2]]
 Output: 3
 Explanation: One way to make 3 moves is as follows:
 1. Remove stone [2,2] because it shares the same row as [2,0].
 2. Remove stone [2,0] because it shares the same column as [0,0].
 3. Remove stone [0,2] because it shares the same row as [0,0].
 Stones [0,0] and [1,1] cannot be removed since they do not share a row/column with another stone still on the plane.

 Example 3:

 Input: stones = [[0,0]]
 Output: 0
 Explanation: [0,0] is the only stone on the plane, so you cannot remove it.

  

 Constraints:

     1 <= stones.length <= 1000
     0 <= xi, yi <= 10^4
     No two stones are at the same coordinate point.


 */
import Foundation

class Solution {
    func removeStones(_ stones: [[Int]]) -> Int {
        var dict = [[Int]: [Int]]()
        for stone in stones {
            dict[stone] = stone
        }

        func find(_ node: [Int]) -> [Int] {
            if dict[node]! == node {return node}
            dict[node] = find(dict[node]!)
            return dict[node]!
        }

        var res = 0

        func union(_ node1: [Int], _ node2: [Int]) {
            let root1 = find(node1), root2 = find(node2)
            if root1 != root2 {res += 1}
            dict[root1] = root2
        }

        for stone1 in stones {
            for stone2 in stones {
                if stone1[0] == stone2[0] {
                    union(stone1,stone2)
                }
                if stone1[1] == stone2[1] {
                    union(stone1,stone2)
                }
            }
        }
        return res
    }
}

let x = Solution()
print(x.removeStones([[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]]))
print(x.removeStones([[0,0],[0,2],[1,1],[2,0],[2,2]]))




//Faster Solution

struct UnionFind {
    var parent: [Int]
    var count: [Int]
    
    init(_ n: Int) {
        parent = Array(0...n)
        count = Array(repeating: 1, count: n + 1)
    }
    
    mutating func find(_ i: Int) -> Int {
        if parent[i] != i {
            parent[i] = find(parent[i])
        }
        return parent[i]
    }
    
    mutating func union(_ i: Int, _ j: Int) -> Bool {
        let parentI = find(i), parentJ = find(j)
        
        if parentI == parentJ {
            return false
        }
        
        if count[parentI] <= count[parentJ] {
            parent[parentI] = parentJ
            count[parentJ] += count[parentI]
        } else {
            parent[parentJ] = parentI
            count[parentI] += count[parentJ]
        }
        return true
    }
    
}
class Solution2 {
    func removeStones(_ stones: [[Int]]) -> Int {
        var uf = UnionFind(stones.count)
        for i in 0 ..< stones.count {
            for j in (i + 1) ..< stones.count {
                if stones[i][0] == stones[j][0] || stones[i][1] == stones[j][1] {
                    uf.union(i, j)
                }
            }
        }
        
        var counter = 0
        for i in 0 ... stones.count {
            if uf.find(i) == i {
                counter += uf.count[i] - 1
            }
        }
        return counter
    }
}
