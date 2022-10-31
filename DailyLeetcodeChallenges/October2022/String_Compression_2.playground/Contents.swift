import Foundation
//class Solution2 {
//    func getLengthOfOptimalCompression(_ s: String, _ k: Int) -> Int {
//        guard s.count > 0 && s.count <= 100 && k >= 0 && k <= s.count else { return 0 }
//        var k1 = k
//        let s1 = s.compactMap{
//            $0
//        }
//        var string : String = String(s1.first ?? Character(""))
//        var count = 1
//        for i in 1..<s.count{
//            let current = s1[i]
//            let previous = s1[i-1]
//
//            if current == previous {
//                count += 1
//            }else{
//                if count > 1 {
//                    string.append(String(count))
//                    count = 1
//                } else if count == 1 && k1 > 0 {
//                    string.removeLast()
//                    k1 -= 1
//                }
//                string.append(current)
//            }
//        }
//
//        if count > 1 {
//            string.append(String(count))
//            count = 1
//        }else if count == 1 && k1 > 0 {
//                string.removeLast()
//                k1 -= 1
//            }
//        return string.count
//    }
//}

//func compression(s: String, _ k: Int) -> String{
//    var k1 = k
//    let s1 = s.compactMap{
//        $0
//    }
//    var string : String = String(s1.first ?? Character(""))
//    var count = 1
//    for i in 1..<s.count{
//        let current = s1[i]
//        let previous = s1[i-1]
//
//        if current == previous {
//            count += 1
//        }else{
//            if count > 1 {
//                string.append(String(count))
//                count = 1
//            } else if count == 1 && k1 > 0 {
//                string.removeLast()
//                k1 -= 1
//            }
//            string.append(current)
//        }
//    }
//
//    if count > 1 {
//        string.append(String(count))
//        count = 1
//    }else if count == 1 && k1 > 0 {
//            string.removeLast()
//            k1 -= 1
//        }
//    return string.count
//}

//print(compression(s: "aaabbcccddeeefggh", 2))
//var arr = Array(repeating: Array(repeating: 0, count: 2), count: 3)
class Solution {
    private var dp : [[Int]] = []
    private var chars : [Character] = []
    private var n = 0
    func getLengthOfOptimalCompression(_ s: String, _ k: Int) -> Int {
        chars = s.compactMap{
            $0
        }
        n = s.count
        dp = Array(repeating : Array(repeating: -1, count: k+1),count: n)
        return dp(0,k)
    }
    
    private func dp(_ i : Int, _ k : Int) -> Int {
        if k<0 { return n }
        if n <= i + k { return 0 }
        var ans = dp[i][k]
        if ans != -1 { return ans }
        ans = dp(i+1, k-1)
        var length = 0
        var same = 0
        var diff = 0
        
        var j = i
        while(j < n && diff <= k){
            if chars[j] == chars[i]{
                same += 1
                if same <= 2 || same == 10 || same == 100 {
                    length += 1
                }
            }else {
                diff += 1
            }
            ans = min(ans,length + dp(j+1,k-diff))
            
            j += 1
        }
        dp[i][k] = ans
        
        return ans
    }
}
// the above code is fastest

