/*

Design a HashSet without using any built-in hash table libraries.

To be specific, your design should include these functions:

add(value): Insert a value into the HashSet. 
contains(value) : Return whether the value exists in the HashSet or not.
remove(value): Remove a value in the HashSet. If the value does not exist in the HashSet, do nothing.

Example:

MyHashSet hashSet = new MyHashSet();
hashSet.add(1);         
hashSet.add(2);         
hashSet.contains(1);    // returns true
hashSet.contains(3);    // returns false (not found)
hashSet.add(2);          
hashSet.contains(2);    // returns true
hashSet.remove(2);          
hashSet.contains(2);    // returns false (already removed)

Note:

All values will be in the range of [0, 1000000].
The number of operations will be in the range of [1, 10000].
Please do not use the built-in HashSet library.

*/


class MyHashSet {
    private let bucketSize : Int = 10
    private var bucket : [[Int?]]
    
    /** Initialize your data structure here. */
    init() {
        bucket = Array.init(repeating: [], count: bucketSize)
    }
    
    func add(_ key: Int) {
        let index = hashValue(key)
        if !bucket[index].contains(key){
            bucket[index].append(key)
        }
    }
    
    func remove(_ key: Int) {
        let index = hashValue(key)
        if let listIndex = bucket[index].firstIndex(of: key){
            bucket[index].remove(at: listIndex)
        }
    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        let index = hashValue(key)
        let listForIndex = bucket[index]
        for i in 0..<listForIndex.count{
            if key == listForIndex[i]{
                return true
            }
        }
        return false
    }
    
    func hashValue(_ element : Int?) -> Int{
        if let element = element{
            return element % bucketSize
        }
        return 0
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */
