/*

Given an integer (signed 32 bits), write a function to check whether it is a power of 4.

Example 1:

Input: 16
Output: true
Example 2:

Input: 5
Output: false
Follow up: Could you solve it without loops/recursion?

*/

class Solution {
    func isPowerOfFour(_ num: Int) -> Bool {
        guard num > 0 else {
            return false
        }
        var power: Int = Int(log10(Double(num)) / log10(Double(4)))
        if num == Int(pow(4,Double(power))) {
            return true
        }else{
            return false
        }
    }
}
