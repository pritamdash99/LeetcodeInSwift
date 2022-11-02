import Foundation
/*
 433. Minimum Genetic Mutation

 A gene string can be represented by an 8-character long string, with choices from 'A', 'C', 'G', and 'T'.

 Suppose we need to investigate a mutation from a gene string start to a gene string end where one mutation is defined as one single character changed in the gene string.

     For example, "AACCGGTT" --> "AACCGGTA" is one mutation.

 There is also a gene bank bank that records all the valid gene mutations. A gene must be in bank to make it a valid gene string.

 Given the two gene strings start and end and the gene bank bank, return the minimum number of mutations needed to mutate from start to end. If there is no such a mutation, return -1.

 Note that the starting point is assumed to be valid, so it might not be included in the bank.
 
 */
class Solution {
    // change the characters "AGCT" turn by turn in the start string and insert it into the visited set if it is not already present and if the new formed string is present in the bank.
    //use bfs

    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        var counter = 0
        var queue = [String]()
        var visited = Set<String>()
        
        queue.append(start)
        visited.insert(start)
        
        while !queue.isEmpty{
            let n = queue.count
            
            for _ in 0..<n{
                let node =  queue.removeFirst()
                
                if node == end { return counter }
                
                for ch in "ACGT"{
                    for j in 0..<node.count{
                        var adjNode = Array(node)
                        adjNode[j] = ch
                        if !visited.contains((String(adjNode))) && bank.contains(String(adjNode)){
                            queue.append(String(adjNode))
                            visited.insert(String(adjNode))
                        }
                    }
                }
            }
            counter += 1
        }
        
        return -1
    }
}

let x = Solution()
print(x.minMutation("AAAAACCC", "AACCCCCC",["AAAACCCC","AAACCCCC","AACCCCCC"]))
