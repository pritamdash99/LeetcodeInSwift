/*
 2256. Minimum Average Difference

 You are given a 0-indexed integer array nums of length n.

 The average difference of the index i is the absolute difference between the average of the first i + 1 elements of nums and the average of the last n - i - 1 elements. Both averages should be rounded down to the nearest integer.

 Return the index with the minimum average difference. If there are multiple such indices, return the smallest one.

 Note:

     The absolute difference of two numbers is the absolute value of their difference.
     The average of n elements is the sum of the n elements divided (integer division) by n.
     The average of 0 elements is considered to be 0.

 Example 1:

 Input: nums = [2,5,3,9,5,3]
 Output: 3
 Explanation:
 - The average difference of index 0 is: |2 / 1 - (5 + 3 + 9 + 5 + 3) / 5| = |2 / 1 - 25 / 5| = |2 - 5| = 3.
 - The average difference of index 1 is: |(2 + 5) / 2 - (3 + 9 + 5 + 3) / 4| = |7 / 2 - 20 / 4| = |3 - 5| = 2.
 - The average difference of index 2 is: |(2 + 5 + 3) / 3 - (9 + 5 + 3) / 3| = |10 / 3 - 17 / 3| = |3 - 5| = 2.
 - The average difference of index 3 is: |(2 + 5 + 3 + 9) / 4 - (5 + 3) / 2| = |19 / 4 - 8 / 2| = |4 - 4| = 0.
 - The average difference of index 4 is: |(2 + 5 + 3 + 9 + 5) / 5 - 3 / 1| = |24 / 5 - 3 / 1| = |4 - 3| = 1.
 - The average difference of index 5 is: |(2 + 5 + 3 + 9 + 5 + 3) / 6 - 0| = |27 / 6 - 0| = |4 - 0| = 4.
 The average difference of index 3 is the minimum average difference so return 3.

 Example 2:

 Input: nums = [0]
 Output: 0
 Explanation:
 The only index is 0 so return 0.
 The average difference of index 0 is: |0 / 1 - 0| = |0 - 0| = 0.

 Constraints:

     1 <= nums.length <= 10^5
     0 <= nums[i] <= 10^5

 */
import Foundation

/*
 Approach : Prefix Sum
 Intuition

 First of all, if you don't know, prefix sum is the technique where we generate a prefix array, and it's each element at (i + 1)th index stores the cumulative sum of all array elements from index 0 to index i.

 If you carefully notice, when in the previous approach at each index i, we needed sum of all elements of nums array from index 0 to index i, thus we can conclude that we can use a prefix array instead of iterating again on all elements.

 Just like, prefix sums, we can store suffix sum for the nums array to get the sum of all elements from index i + 1 till last index in optimal way
 
 Algorithm

     Initialize variables:
         n, integer to store the number of elements in the array.
         minAvgDiff, initialized with a large integer value, stores the minimum average difference.
         ans, integer to store the index where we found the minimum average difference.
         prefixSum, suffixSum, integer arrays to store prefix and suffix sums for the nums array.

     Precompute prefix and suffix sums for the nums array.
         For prefix sum, iterate from start to end and add the current element to the previous prefix sum.
         For suffix sum, iterate from end to start and add the current element to the previous suffix sum.

     Iterate over each index of the nums array:
         At each index i, get the sum of all elements of the nums array from index 0 to index i stored in prefixSum[i + 1], and divide the sum by i + 1 to get the average of the left part of the array.
         Similarly, get the sum of elements from index i +1 to n - 1 stored in suffix[i + 1], and divide by n - i - 1 to get the average of the right part of the array.
         If the difference between the average of the left and right part of the array is smaller than minAvgDiff, then store this difference in minAvgDiff and the current index i in ans.

     Return ans.

 */
class Solution {
    func minimumAverageDifference(_ nums: [Int]) -> Int {
        let n = nums.count
        var ans = -1
        var minAvgDiff = Int32.max
        
        // Generate prefix and suffix sum arrays.
        var prefixSum = [Int64](repeating: 0, count: n + 1)
        var suffixSum = [Int64](repeating: 0, count: n + 1)
        
        for index in 0..<n {
            prefixSum[index + 1] = prefixSum[index] + Int64(nums[index])
        }
        
        for index in (0..<n).reversed() {
            suffixSum[index] = suffixSum[index + 1] + Int64(nums[index])
        }
        
        for index in 0..<n {
            // Calculate average of left part of array, index 0 to i.
            var leftPartAverage = prefixSum[index + 1]
            leftPartAverage /= Int64(index + 1)
            
            // Calculate average of right part of array, index i+1 to n-1.
            var rightPartAverage = suffixSum[index + 1]
            // If right part have 0 elements, then we don't divide by 0.
            if (index != n - 1) {
                rightPartAverage /= Int64(n - index - 1)
            }
            
            let currDifference = abs(leftPartAverage - rightPartAverage)
            // If current difference of averages is smaller,
            // then current index can be our answer.
            if (currDifference < minAvgDiff) {
                minAvgDiff = Int32(currDifference)
                ans = index
            }
        }
        
        return ans
    }
}

let x = Solution()
print(x.minimumAverageDifference([2,5,3,9,5,3]))

/*
 Complexity Analysis

 Here, N is the number of elements in the nums array.

     Time complexity: O(n)O(n)O(n).
         We iterate over nums array to precompute prefixSum and suffixSum arrays.
         Then, we iterate over each index of the nums array and at each index, we calculate averages of two parts in constant time using prefixSum and suffixSum arrays.
         Thus, for finding the difference of averages at nnn indices, it will take O(n)O(n)O(n) time.

     Space complexity: O(n)O(n)O(n).
         We have used two arrays of size nnn to store prefix and suffix sums of nums array.
         Thus, overall it will take O(n)O(n)O(n) space.

 */


/*
 Approach : Prefix Sum Optimized
 Intuition

 Our runtime for the previous approach is fairly efficient, but we are using some auxiliary space.
 Let's try optimizing it now.

 We are using two arrays, prefixSum to store the sum of all the elements of the array from index 0 to index i to get the left part's sum, and suffixSum to store the sum of elements from index i + 1 to the last index to get the right part's sum.

 But if we already had the sum of all elements of the array, then we can subtract the left part's sum from it to get the right part's sum, thus we can discard the suffixSum array and use only prefixSum array with a totalSum variable.

 But further we can notice, that while iterating on every index for breaking the nums array in two parts at that index, every time we only use the value at the current index i from the prefixSum array. Thus, instead of storing all prefix sums in an array, we can store the prefix sum till index i in a variable. So, we can also discard the prefixSum array and only use a currPrefixSum variable instead of it.
 Thus, instead of two arrays, we can use only two variables totalSum and currPrefixSum.
 
 Algorithm

     Initialize variables:
         n, integer to store the number of elements in the array.
         minAvgDiff, initialized with a large integer value, stores the minimum average difference.
         totalSum, a variable to store the sum of all elements of the nums array.
         currPrefixSum, a variable to store the sum of all elements till the current index of the nums array.
         ans, integer to store the index where we found the minimum average difference.

     Iterate on the nums array and calculate totalSum.

     Iterate over each index of the nums array:
         At each index i, we add the current element in currPrefixSum, to get the sum of all elements of the nums array from index 0 to index i, and divide the sum by i + 1 to get the average of the left part of the array.
         Similarly, we can get the sum of elements from index i + 1 to n - 1 after subtracting the left part's sum from the total sum of the array, and then divide it by n - i - 1 to get the average of the right part of the array.
         If the difference between the average of the left and right part of the array is smaller than minAvgDiff, then store this difference in minAvgDiff and the current index i in ans.

     Return ans.

 */
class Solution2 {
    func minimumAverageDifference(_ nums: [Int]) -> Int {
        let n = nums.count
        var ans = -1
        var minAvgDiff = Int32.max
        var currPrefixSum: Int64 = 0
        
        // Get total sum of array.
        var totalSum: Int64 = 0
        for index in 0..<n {
            totalSum += Int64(nums[index])
        }
        
        for index in 0..<n {
            currPrefixSum += Int64(nums[index])
            
            // Calculate average of left part of array, index 0 to i.
            var leftPartAverage = currPrefixSum
            leftPartAverage /= Int64(index + 1)
            
            // Calculate average of right part of array, index i+1 to n-1.
            var rightPartAverage = totalSum - currPrefixSum
            // If right part have 0 elements, then we don't divide by 0.
            if (index != n - 1) {
                rightPartAverage /= Int64(n - index - 1)
            }
            
            let currDifference = abs(leftPartAverage - rightPartAverage)
            // If current difference of averages is smaller,
            // then current index can be our answer.
            if (currDifference < minAvgDiff) {
                minAvgDiff = Int32(currDifference)
                ans = index
            }
        }
        
        return ans;
    }
}
/*
 Complexity Analysis

 Here, N is the number of elements in the nums array.

     Time complexity: O(n)O(n)O(n).
         We iterate over each index of the nums array and at each index, we calculate averages of two parts in constant time using currSum and totalSum variables.
         Thus, for finding the difference of averages at nnn indices, it will take O(n)O(n)O(n) time.

     Space complexity: O(1)O(1)O(1).
         We have only used some integer variables. Thus, the space used is constant.

 */
