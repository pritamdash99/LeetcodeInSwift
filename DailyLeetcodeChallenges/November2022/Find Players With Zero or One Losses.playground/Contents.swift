/*
 2225. Find Players With Zero or One Losses

 You are given an integer array matches where matches[i] = [winneri, loseri] indicates that the player winneri defeated player loseri in a match.

 Return a list answer of size 2 where:

     answer[0] is a list of all players that have not lost any matches.
     answer[1] is a list of all players that have lost exactly one match.

 The values in the two lists should be returned in increasing order.

 Note:

     You should only consider the players that have played at least one match.
     The testcases will be generated such that no two matches will have the same outcome.

 Example 1:

 Input: matches = [[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]]
 Output: [[1,2,10],[4,5,7,8]]
 Explanation:
 Players 1, 2, and 10 have not lost any matches.
 Players 4, 5, 7, and 8 each have lost one match.
 Players 3, 6, and 9 each have lost two matches.
 Thus, answer[0] = [1,2,10] and answer[1] = [4,5,7,8].

 Example 2:

 Input: matches = [[2,3],[1,3],[5,4],[6,4]]
 Output: [[1,2,5,6],[]]
 Explanation:
 Players 1, 2, 5, and 6 have not lost any matches.
 Players 3 and 4 each have lost two matches.
 Thus, answer[0] = [1,2,5,6] and answer[1] = [].

  

 Constraints:

     1 <= matches.length <= 10^5
     matches[i].length == 2
     1 <= winner_i, loser_i <= 10^5
     winner_i != loser_i
     All matches[i] are unique.

 */
import Foundation
//fastest solution
class Solution {
    func findWinners(_ matches: [[Int]]) -> [[Int]] {
        
        // iterate through each match
        // insert winner with 0 in lossTable if not already in there
        // insert loser with 1 in lossTable if not there, else increment count
        
        // get dictionary keys and iterate over them, build lists of 0 or 1 loss
        
        let WINNER_IDX = 0
        let LOSER_IDX = 1
    
        var lossCounts: [Int: Int] = [:]
        
        for match in matches {
            let winner = match[WINNER_IDX]
            let loser = match[LOSER_IDX]
            if(lossCounts[winner] == nil) {
                lossCounts[winner] = 0
            }
            
            if(lossCounts[loser] == nil) {
                lossCounts[loser] = 1
            } else {
                lossCounts[loser] = lossCounts[loser]! + 1
            }
        }
        
        var zeroLossPlayers: [Int] = []
        var oneLossPlayers: [Int] = []
        
        for key in lossCounts.keys {
            if(lossCounts[key] == 0) {
                zeroLossPlayers.append(key)
            } else if(lossCounts[key] == 1) {
                oneLossPlayers.append(key)
            }
        }
        
        return [zeroLossPlayers.sorted(), oneLossPlayers.sorted()]
    }
}

let x = Solution()
print(x.findWinners([[2,3],[1,3],[5,4],[6,4]]))
/*
 o/p :
 [[1, 2, 5, 6], []]
 */
