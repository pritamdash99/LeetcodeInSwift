import Foundation

class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        guard !nums.isEmpty else { return false }
        
        var first = Int.max
        var second = Int.max
        for x in nums{
            if x < first{
                first =  x
            }
            else if x > first && x < second {
                second = x
            }
            else if x > second {
                return true
            }
        }
        return false
    }
}

//faster solution :

class Solution2 {
func increasingTriplet(_ nums: [Int]) -> Bool {
        var firstNum = Int.max, secondNum = Int.max
        
        // use two variable to memorize the largets and 2nd largest
        // then just a for-loop traversal
        for num in nums {
            if [firstNum, secondNum, num].min() == num {
                firstNum = num
            }
            else if num > firstNum, min(num, secondNum) == num {
                secondNum = num
            }
            else {
                return true
            }
        }
        return false
    }
}


//[20,100,10,12,5,13]

