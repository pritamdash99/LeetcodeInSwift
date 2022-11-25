/*
 907. Sum of Subarray Minimums
 Given an array of integers arr, find the sum of min(b), where b ranges over every (contiguous) subarray of arr. Since the answer may be large, return the answer modulo 10^9 + 7.

 Example 1:

 Input: arr = [3,1,2,4]
 Output: 17
 Explanation:
 Subarrays are [3], [1], [2], [4], [3,1], [1,2], [2,4], [3,1,2], [1,2,4], [3,1,2,4].
 Minimums are 3, 1, 2, 4, 1, 1, 2, 1, 1, 1.
 Sum is 17.

 Example 2:

 Input: arr = [11,81,94,43,3]
 Output: 444

 Constraints:

     1 <= arr.length <= 3 * 10^4
     1 <= arr[i] <= 3 * 10^4

 */
import Foundation

class Solution {
    func sumSubarrayMins(_ arr: [Int]) -> Int {
        let mod = Int(1E9+7)
        var stack = [Int](), sums = arr.map{_ in 0}
        for (i, n) in arr.enumerated() {
            while !stack.isEmpty && arr[stack.last!] > n {
                stack.removeLast()
            }
            let j = stack.isEmpty ? -1: stack.last!
            if j == -1 {
                sums[i] = sums.last! + (i-j)*n
            } else {
                sums[i] = sums[j] + (i-j)*n
            }
            
            stack.append(i)
        }
        return sums.reduce(0,+) % mod
    }
}
