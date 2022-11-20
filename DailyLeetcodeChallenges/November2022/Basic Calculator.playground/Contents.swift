/*
 224. Basic Calculator

 Given a string s representing a valid expression, implement a basic calculator to evaluate it, and return the result of the evaluation.

 Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as eval().

  

 Example 1:

 Input: s = "1 + 1"
 Output: 2

 Example 2:

 Input: s = " 2-1 + 2 "
 Output: 3

 Example 3:

 Input: s = "(1+(4+5+2)-3)+(6+8)"
 Output: 23

  

 Constraints:

     1 <= s.length <= 3 * 10^5
     s consists of digits, '+', '-', '(', ')', and ' '.
     s represents a valid expression.
     '+' is not used as a unary operation (i.e., "+1" and "+(2 + 3)" is invalid).
     '-' could be used as a unary operation (i.e., "-1" and "-(2 + 3)" is valid).
     There will be no two consecutive operators in the input.
     Every number and running calculation will fit in a signed 32-bit integer.


 */
import Foundation
//This solution doesnot work for an entire integer string.
class Solution {
    func calculate(_ s: String) -> Int {
        
        let s = Array(s)
        let n = s.count
        var sign = 1
        var ans = 0
        var currentNumber = 0
        
        var stack = [Int]()
        
        for i in 0..<n{
            if s[i].isNumber{
                currentNumber = (Int(String(s[i]))!)
                var j = i
                while j + 1 < n && s[j+1].isNumber{
                    currentNumber = currentNumber * 10 + (Int(String(s[j+1]))!)
                    j += 1
                }
                currentNumber *= sign
                ans += currentNumber
                currentNumber = 0
                sign = 1
            }
            else if s[i] == Character("+"){
                sign = 1
            }
            else if s[i] == Character("-"){
                sign = -1
            }
            else if s[i] == Character("("){
                stack.append(ans)
                stack.append(sign)
                ans = 0
                sign = 1
            }
            else if s[i] == Character(")"){
                let previousSign = stack.removeLast()
                ans *= previousSign
                let previousAnswer = stack.removeLast()
                ans += previousAnswer
            }
        }
        return ans
    }
}

let x = Solution()
print(x.calculate("(1+(4+5+2)-3)+(6+8)"))
// O/p = 23
print(x.calculate("123456")) // O/p : 150886 wrong answer.


//Bellow two solution works for all cases.
class Solution2 {
    func calculate(_ s: String) -> Int {
        var result = 0
        var num = 0
        var sign = 1
        var stack = [1]
        
        for char in s {
            if char == Character("+") || char == Character("-"){
                result += num * sign
                sign = stack.last! * (char == Character("+") ? 1 : -1)
                num = 0
            }else if char == Character("("){
                stack.append(sign)
            }else if char == Character(")"){
                stack.removeLast()
            }else{
                num = num * 10 + char.wholeNumberValue!
            }
        }
        return result + num * sign
    }
}

//Faster Solution
class Solution3 {
    func calculate(_ s: String) -> Int {
        
        
        let zero: UInt8 = 48
        
        func charToInt(_ char: Character) -> Int {
            Int(char.asciiValue! - zero)
        }
        
        var stk = [Int]()
        var result = 0
        var current = 0
        var sign = 1
        
        for ch in s {
            if ch.isNumber {
                let d = charToInt(ch)
                current = current * 10 + d
            } else if ch == "+" {
                result += sign * current
                sign = 1
                current = 0
            } else if ch == "-" {
                result += sign * current
                sign = -1
                current = 0
            } else if ch == "(" {
                stk.append(result)
                stk.append(sign)
                
                sign = 1
                result = 0
                current = 0
                
            } else if ch == ")" {
                result += sign * current
                result *= stk.removeLast()
                result += stk.removeLast()
                sign = 1
                current = 0
            }
            // print(result, sign, current)
        }
        return result + sign * current
    }
}
