import Foundation

class Solution {
    func intToRoman(_ num: Int) -> String {
        var n = num
        var result = String()
        let notations : [String] = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]
        let value : [Int] = [1000,900,500,400,100,90,50,40,10,9,5,4,1]
        var pos = 0
        while n > 0{
            while n >= value[pos]{
                result += notations[pos]
                n -= value[pos]
            }
            pos += 1
        }
        
        return result
    }
}

//Faster solution :
func intToRoman(_ num: Int) -> String {
        let values: [Int] = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        let symbols: [String] = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]

        var roman: String = ""
        var rest: Int = num
        for (index, symbol) in symbols.enumerated() {
            while values[index] <= rest {
                rest -= values[index]
                roman += symbol
            }
        }
        return roman
    }
