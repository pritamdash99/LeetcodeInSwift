/*
 263. Ugly Number

 An ugly number is a positive integer whose prime factors are limited to 2, 3, and 5.

 Given an integer n, return true if n is an ugly number.
 
 Example 1:

 Input: n = 6
 Output: true
 Explanation: 6 = 2 × 3

 Example 2:

 Input: n = 1
 Output: true
 Explanation: 1 has no prime factors, therefore all of its prime factors are limited to 2, 3, and 5.

 Example 3:

 Input: n = 14
 Output: false
 Explanation: 14 is not ugly since it includes the prime factor 7.

 Constraints:

     -2^31 <= n <= 2^31 - 1


 */
import Foundation

//This is also fast.
class Solution {
    func isUgly(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        var n = n
        
        if n > 0 && n < 6{
            return true
        }
        
        repeat{
            if n % 5 == 0 {
                n /= 5
            }else if n % 3 == 0 {
                n /= 3
            }else if n % 2 == 0{
                n /= 2
            }
        }while (n % 5 == 0 || n % 3 == 0 || n % 2 == 0)
        
        if n == 1 {
            return true
        }else{
            return false
        }
    }
}


//Faster solution :

class Solution2 {
    func isUgly(_ n: Int) -> Bool {
        if n == 1 {
            return true
        } else if n < 1 {
            return false
        }

        var num = n
        while (num % 2 == 0) {
            num /= 2
        }

        while (num % 3 == 0) {
            num /= 3
        }

        while (num % 5 == 0) {
            num /= 5
        }

        return num == 1
    }
}
