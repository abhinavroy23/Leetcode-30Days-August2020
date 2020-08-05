/*

Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

Note: For the purpose of this problem, we define empty string as valid palindrome.

Example 1:

Input: "A man, a plan, a canal: Panama"
Output: true
Example 2:

Input: "race a car"
Output: false
 

Constraints:

s consists only of printable ASCII characters.

*/

class Solution {
  func isPalindrome(_ s: String) -> Bool {
    func isAlphaNumeric(_ char: Character) -> Bool {
      if let ascii = char.asciiValue, ((ascii >= 65 && ascii <= 90) || (ascii >= 97 && ascii <= 122) || (ascii >= 48 && ascii <= 57)) {
        return true
      }
      return false
    }
    
    guard s.count > 0 else {
      return true
    }
    let array: [Character] = Array(s)
    var first: Int = 0
    var last: Int = array.count - 1
    
    while first < last {
      if !isAlphaNumeric(array[first])      {
        first += 1
        continue
      }
      if !isAlphaNumeric(array[last]) {
        last -= 1
        continue
      }
      if array[first].lowercased() != array[last].lowercased() {
        return false
      } else {
        first += 1
        last -= 1
      }
    }
    return true
  }
}
