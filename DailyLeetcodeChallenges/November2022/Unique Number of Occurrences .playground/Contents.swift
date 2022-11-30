/*
 1207. Unique Number of Occurrences

 Given an array of integers arr, return true if the number of occurrences of each value in the array is unique, or false otherwise.

 Example 1:

 Input: arr = [1,2,2,1,1,3]
 Output: true
 Explanation: The value 1 has 3 occurrences, 2 has 2 and 3 has 1. No two values have the same number of occurrences.

 Example 2:

 Input: arr = [1,2]
 Output: false

 Example 3:

 Input: arr = [-3,0,1,-3,1,1,1,-3,10,0]
 Output: true

 Constraints:

     1 <= arr.length <= 1000
     -1000 <= arr[i] <= 1000

 */
import Foundation

class Solution {
    //fastest solution
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var map = [Int:Int]()
        for x in arr {
            let val = map[x]
            if val == nil {
                map[x] = 1
            }else{
                map[x]! += 1
            }
        }
        return Set(map.values).count == map.values.count
    }
}

let x = Solution()
print(x.uniqueOccurrences([-3,0,1,-3,1,1,1,-3,10,0])) // true
print(x.uniqueOccurrences([1,2])) // false
print(x.uniqueOccurrences([1,2,2,1,1,3])) // true
