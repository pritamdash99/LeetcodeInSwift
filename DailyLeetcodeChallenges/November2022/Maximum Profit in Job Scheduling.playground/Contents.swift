/*
 1235. Maximum Profit in Job Scheduling

 We have n jobs, where every job is scheduled to be done from startTime[i] to endTime[i], obtaining a profit of profit[i].

 You're given the startTime, endTime and profit arrays, return the maximum profit you can take such that there are no two jobs in the subset with overlapping time range.

 If you choose a job that ends at time X you will be able to start another job that starts at time X.
 
 Example 1 :
 Input: startTime = [1,2,3,3], endTime = [3,4,5,6], profit = [50,10,40,70]
 Output: 120
 Explanation: The subset chosen is the first and fourth job.
 Time range [1-3]+[3-6] , we get profit of 120 = 50 + 70.
 
 Example 2 :
 Input: startTime = [1,2,3,4,6], endTime = [3,5,10,6,9], profit = [20,20,100,70,60]
 Output: 150
 Explanation: The subset chosen is the first, fourth and fifth job.
 Profit obtained 150 = 20 + 70 + 60.
 
 Example 3 :
 Input: startTime = [1,1,1], endTime = [2,3,4], profit = [5,6,4]
 Output: 6
 
 */
import Foundation

class Solution {
    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        let n = startTime.count
        var arr = [(Int, Int, Int)]() //(start, end, profit)
        for i in 0..<n {
            arr.append((startTime[i], endTime[i], profit[i]))
        }

        arr.sort(by: { $0.1 < $1.1 })

        var dp = [(-1, 0)] //(end, profit)
        var ans = 0

        func search(_ time: Int) -> (Int, Int) {
            var l = 0
            var r = dp.count-1

            while l < r {
                let mid = (l+r)/2
                if dp[mid].0 <= time {
                    l = mid + 1
                } else if dp[mid].0 > time {
                    r = mid
                }
            }

            if r == 0 || dp[r].0 <= time {
                return dp[r]
            }

            return dp[r-1]
        }

        for i in 0..<n {
            let (start, end, pro) = arr[i]
            let last = search(start)
            ans = max(ans, last.1 + pro)
            dp.append((end, ans))
        }

        return ans
    }
}

let x = Solution()
print(x.jobScheduling([1,2,3,4,6], [3,5,10,6,9], [20,20,100,70,60]))
/*
 O/p : 150
 */

//Another Solution
class Solution2 {
    struct Job {
        let start: Int
        let end: Int
        let profit: Int
    }
    
    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        var jobs = [Job]()
        
        for i in 0 ..< startTime.count {
            let job = Job.init(start: startTime[i], end: endTime[i], profit: profit[i])
            jobs.append(job)
        }
        
        //sort jobs by end time
        jobs.sort(by: {$0.end < $1.end})
        
        //max profit at end time
        var dpEndTime = [Int]()
        var dpProfit = [Int]()
        //at time 0, profit is 0
        dpEndTime.append(0)
        dpProfit.append(0)
        
        for job in jobs {
            //preJob is: If we do this job,
            //binary search in the dp to find the largest profit we can make before start time s.
            //largest profit before start time s is preJob
            let preJob = smallerOrEqual(dpEndTime, job.start)
            let noPickProfit = dpProfit[dpProfit.count - 1]
            let pickProfit = dpProfit[preJob] + job.profit
            
            if pickProfit > noPickProfit {
                dpEndTime.append(job.end)
                dpProfit.append(pickProfit)
            } else {
                dpEndTime.append(job.end)
                dpProfit.append(noPickProfit)
            }
        }
        
        return dpProfit[dpProfit.count - 1]
    }
    
    func smallerOrEqual(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            let midVal = nums[mid]
            
            if nums[mid] <= target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        

        
        
        return right
    }
}
