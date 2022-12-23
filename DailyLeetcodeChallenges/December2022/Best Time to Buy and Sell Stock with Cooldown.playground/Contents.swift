/*
 309. Best Time to Buy and Sell Stock with Cooldown

 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 Find the maximum profit you can achieve. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times) with the following restrictions:

     After you sell your stock, you cannot buy stock on the next day (i.e., cooldown one day).

 Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

 Example 1:

 Input: prices = [1,2,3,0,2]
 Output: 3
 Explanation: transactions = [buy, sell, cooldown, buy, sell]

 Example 2:

 Input: prices = [1]
 Output: 0

 Constraints:

     1 <= prices.length <= 5000
     0 <= prices[i] <= 1000

 */
import Foundation

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let count = prices.count
        guard count != 0 else {
            return 0
        }
        var sell = 0
        var buy = -prices[0]
        var cooldown = 0;
        for i in 1..<count {
            let preSell = sell
            let prevCooldown = cooldown
            sell = maxi(buy+prices[i], sell)
            cooldown = maxi(maxi(preSell,buy),cooldown)
            buy = maxi(prevCooldown - prices[i], buy)
        }
        return maxi(maxi(sell,buy),cooldown)
    }
    private func maxi(_ a: Int, _ b: Int) -> Int{
        return a > b ? a : b
    }
}

//faster solution
class Solution2 {
    func maxProfit(_ prices: [Int]) -> Int {
        var hold = -1000 // bought yesterday or earier
        var notHoldA = 0 // didn't sell yesterday (ready to buy today)
        var notHoldB = 0 // probably sold yesterday (not ready to buy today)

        for price in prices {
            (hold,
             notHoldA,
             notHoldB) = (maxi(hold, notHoldA - price),
                          maxi(notHoldA, notHoldB),
                          max(notHoldA, notHoldB, hold + price))
        }
        
        return notHoldB
    }
    private func maxi(_ a: Int, _ b: Int) -> Int{
        return a > b ? a : b
    }
}
