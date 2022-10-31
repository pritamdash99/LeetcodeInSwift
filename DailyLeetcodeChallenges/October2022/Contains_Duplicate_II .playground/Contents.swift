import Foundation

class Solution {
    //This is O(n^2) format, gives tle
    func containsNearbyDuplicate1(_ nums: [Int], _ k: Int) -> Bool {
        guard nums.count > 0 && nums.count <= 100000 && k >= 0 && k <= 100000 else { return false }
        for i in 0..<nums.count - 1{
            for j in i+1..<nums.count{
                if nums[i] == nums[j] && abs(i-j) <= k {
                    return true
                }
            }
        }
        return false
    }
    
    //faster solution - O(n)
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        guard nums.count > 0 && nums.count <= 100000 && k >= 0 && k <= 100000 else { return false }
        var dict : [Int:Int] = [:]
        for i in 0..<nums.count{
            let val = dict[nums[i]]
            if val == nil {
                dict[nums[i]] = i
            }else{
                if abs(val!-i) <= k {
                    return true
                }else{
                    dict[nums[i]] = i
                }
            }
        }
        return false
    }
    
}
let x = Solution()
let arr = [1,0,1,1]
print(x.containsNearbyDuplicate(arr, 1)) // O/p = false for arr = [1,2,3,1,2,3] and k = 2


