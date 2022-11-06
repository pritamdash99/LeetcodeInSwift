/*
 899. Orderly Queue
 
 You are given a string s and an integer k. You can choose one of the first k letters of s and append it at the end of the string..

 Return the lexicographically smallest string you could have after applying the mentioned step any number of moves.
 
 Example 1:

 Input: s = "cba", k = 1
 Output: "acb"
 Explanation:
 In the first move, we move the 1st character 'c' to the end, obtaining the string "bac".
 In the second move, we move the 1st character 'b' to the end, obtaining the final result "acb".

 Example 2:

 Input: s = "baaca", k = 3
 Output: "aaabc"
 Explanation:
 In the first move, we move the 1st character 'b' to the end, obtaining the string "aacab".
 In the second move, we move the 3rd character 'c' to the end, obtaining the final result "aaabc".

 */

import Foundation

class Solution {
    func orderlyQueue(_ s: String, _ k: Int) -> String {
        guard k > 0 else { return s }
        if k > 1 {
            return String(s.sorted())
        }else{
            var ans = s
            let arr = Array(s)
            for i in 0..<s.count{
                ans = min(ans,String(arr[i...] + arr[0..<i]))
            }
            return ans
        }
    }
}

let x = Solution()
print(x.orderlyQueue("cba", 1))

class Solution2 {
    func orderlyQueue(_ s: String, _ k: Int) -> String {
        let arr = Array(s)

        if k == 1 {
            var res = s
            for i in 0..<s.count {
                res = min(res, String(arr[i...] + arr[0..<i]))
            }
            return res
        }
        return String(arr.sorted { $0 < $1 })
    }
}
