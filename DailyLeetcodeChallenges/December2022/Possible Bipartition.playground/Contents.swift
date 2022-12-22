/*
 886. Possible Bipartition

 We want to split a group of n people (labeled from 1 to n) into two groups of any size. Each person may dislike some other people, and they should not go into the same group.

 Given the integer n and the array dislikes where dislikes[i] = [ai, bi] indicates that the person labeled ai does not like the person labeled bi, return true if it is possible to split everyone into two groups in this way.

  

 Example 1:

 Input: n = 4, dislikes = [[1,2],[1,3],[2,4]]
 Output: true
 Explanation: group1 [1,4] and group2 [2,3].

 Example 2:

 Input: n = 3, dislikes = [[1,2],[1,3],[2,3]]
 Output: false

 Example 3:

 Input: n = 5, dislikes = [[1,2],[2,3],[3,4],[4,5],[1,5]]
 Output: false

  

 Constraints:

     1 <= n <= 2000
     0 <= dislikes.length <= 10^4
     dislikes[i].length == 2
     1 <= dislikes[i][j] <= n
     ai < bi
     All the pairs of dislikes are unique.


 */
import Foundation

class Solution {
    func possibleBipartition(_ N: Int, _ dislikes: [[Int]]) -> Bool {
        var edges = [[Int]](repeating: [Int](), count: N+1)
        for dislike in dislikes {
            edges[dislike[0]].append(dislike[1])
            edges[dislike[1]].append(dislike[0])
        }

        var color = [Int](repeating: -1, count: N+1)
        for p in 1...N {
            if color[p] == -1 {
                color[p] = 1
                var queue = [p]
                while queue.isEmpty == false {
                    let curr = queue.removeFirst()
                    let currColor = color[curr]
                    for adjacent in edges[curr] {
                        if color[adjacent] == -1 {
                            color[adjacent] = currColor ^ 1
                            queue.append(adjacent)
                        } else if color[adjacent] != currColor ^ 1 {
                            return false
                        }
                    }
                }
            }
        }
        return true
    }
}
