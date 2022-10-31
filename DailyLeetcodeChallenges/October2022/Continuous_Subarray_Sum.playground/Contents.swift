import Foundation

//This code works but is slow O(n^2)
class Solution {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        for i in 0..<nums.count - 1{
            var x = [Int]()
            x.append(nums[i])
            for j in i+1..<nums.count{
                x.append(nums[j])
                if sum(x) % k == 0 {
                    return true
                }
            }
        }
        return false
    }
    
    func sum(_ arr : [Int]) -> Int {
        var sum = 0
        for x in arr{
            sum += x
        }
        return sum
    }
}

let x = Solution()
x.checkSubarraySum([23,2,6,4,7], 13)


//Faster linear code :

class Solution2 {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var dict = [Int:Int]()
        dict[0] = -1
        var sum = 0
        for i in 0..<nums.count{
            sum += nums[i]
            if k != 0 {
                sum = sum % k
            }
            let val = dict[sum]
            if val != nil {
                if i - val! >= 2 {
                    return true
                }
            }else{
                dict[sum] = i
            }
        }
        return false
    }
}

let y = Solution()
y.checkSubarraySum([23,2,6,4,7], 6)
