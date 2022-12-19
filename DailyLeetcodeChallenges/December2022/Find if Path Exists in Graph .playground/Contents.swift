/*
 1971. Find if Path Exists in Graph

 There is a bi-directional graph with n vertices, where each vertex is labeled from 0 to n - 1 (inclusive). The edges in the graph are represented as a 2D integer array edges, where each edges[i] = [ui, vi] denotes a bi-directional edge between vertex ui and vertex vi. Every vertex pair is connected by at most one edge, and no vertex has an edge to itself.

 You want to determine if there is a valid path that exists from vertex source to vertex destination.

 Given edges and the integers n, source, and destination, return true if there is a valid path from source to destination, or false otherwise.
 
 Example 1:
 Input: n = 3, edges = [[0,1],[1,2],[2,0]], source = 0, destination = 2
 Output: true
 Explanation: There are two paths from vertex 0 to vertex 2:
 - 0 → 1 → 2
 - 0 → 2
 
 Example 2 :
 Input: n = 6, edges = [[0,1],[0,2],[3,5],[5,4],[4,3]], source = 0, destination = 5
 Output: false
 Explanation: There is no path from vertex 0 to vertex 5.

  

 Constraints:

     1 <= n <= 2 * 10^5
     0 <= edges.length <= 2 * 10^5
     edges[i].length == 2
     0 <= ui, vi <= n - 1
     ui != vi
     0 <= source, destination <= n - 1
     There are no duplicate edges.
     There are no self edges.

 */
import Foundation

class Solution {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var dict = [Int: [Int]]()
        for edge in edges {
            let a = edge[0], b = edge[1]
            dict[a, default: []].append(b)
            dict[b, default: []].append(a)
        }
        var queue = [source]
        var seen = Set<Int>([source])
        while !queue.isEmpty {
            let temp = queue
            queue.removeAll()
            for node in temp {
                if node == destination {
                    return true
                }
                for next in dict[node, default:[]] {
                    if seen.contains(next) == false {
                        seen.insert(next)
                        queue.append(next)
                    }
                }
            }
        }
        return false
    }
}

//another solution
class Solution2 {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        
        var graph = [[Int]](repeating: [], count: n)
        
        for edge in edges {
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
        
        var stack = [Int]()
        var visited = Set<Int>()
        
        stack.append(source)
        
        while !stack.isEmpty {
            let currentVertex = stack.removeLast()
            visited.insert(currentVertex)
            
            if currentVertex == destination {
                return true
            }
            
            for edge in graph[currentVertex] {
                if !visited.contains(edge) {
                    stack.append(edge)
                }
            }
        }
        
        return false
    }
}


