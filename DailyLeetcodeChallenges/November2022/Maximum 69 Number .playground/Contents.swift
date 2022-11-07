import Foundation
/*
 1323. Maximum 69 Number

 You are given a positive integer num consisting only of digits 6 and 9.

 Return the maximum number you can get by changing at most one digit (6 becomes 9, and 9 becomes 6).
 Example 1:

 Input: num = 9669
 Output: 9969
 Explanation:
 Changing the first digit results in 6669.
 Changing the second digit results in 9969.
 Changing the third digit results in 9699.
 Changing the fourth digit results in 9666.
 The maximum number is 9969.

 Example 2:

 Input: num = 9996
 Output: 9999
 Explanation: Changing the last digit 6 to 9 results in the maximum number.

 Example 3:

 Input: num = 9999
 Output: 9999
 Explanation: It is better not to apply any change.

 */
class Solution {
    func maximum69Number (_ num: Int) -> Int {
        
        let numstr = String(num)
        var nums = Array(numstr)
        for i in 0..<nums.count{
            if nums[i] == "6" {
                nums[i] = "9"
                let x = String(nums)
                return Int(x) ?? 0
            }
        }
        
        return num
    }
}

let x = Solution()
print(x.maximum69Number(69))

//fastest solution but uses space

class Solution2 {
    func maximum69Number (_ num: Int) -> Int {
        let stringRep = String(num)
        
        // First index has index of the first 6
        var firstIndex = -1
        
        for (index, n) in stringRep.enumerated() {
            if n == "6" {
                firstIndex = index
                break
            }
        }
        
        if firstIndex != -1 {
            let ss1 = stringRep.prefix(firstIndex)
            let ss2 = stringRep.suffix(stringRep.count - firstIndex - 1)
            let result = ss1 + "9" + ss2
            return Int(result)!
        }
        return num
    }
}

//faster solution
class Solution3 {
    func maximum69Number (_ num: Int) -> Int {
        var count = 0
        let nums = String(num)
        var total: [Character] = []
        for n in nums {
            if n == "6" && count == 0 {
                total.append("9")
                count += 1
            } else {
                total.append(n)
            }
        }
        let result = Int(String(total))!
        return result
    }
}

//fastest solution taking minimum space

class Solution4 {
    func maximum69Number (_ num: Int) -> Int {
        // Since we start with the lowest digit, initialize currDigit = 0.
        var numCopy = num
        var indexSix = -1
        var currentDigit = 0
        
        // Check every digit of 'numCopy' from low to high.
        while numCopy > 0 {
            // If the current digit is '6', record it as the highest digit of 6
            if numCopy % 10 == 6 {
                indexSix = currentDigit
            }
            
            // Move on to the next digit.
            numCopy /= 10
            currentDigit += 1
        }
        
        // If we don't find any digit of '6', return the original number,
        // otherwise, increment 'num' by the difference made by the first '6'.
        return indexSix == -1 ? num : num + 3 * Int((pow(10.0, Double(indexSix))))
    }
}
let y = Solution4()
print(x.maximum69Number(69))
