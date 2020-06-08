import Foundation

/* MARK: - Codable and decodable
 
 struct User: Codable {
 var name: String
 var phoneNum: Int
 var email: String
 var subjects: [String]
 }
 
 let jsonFile = """
 {
 "name": "TestUser",
 "phoneNum": 123456789,
 "email": "testUser@asd.com",
 "subjects": ["abc", "def", "ghi"]
 }
 """
 
 let jsonData = jsonFile.data(using: .utf8)!
 do {
 let user = try JSONDecoder().decode(User.self, from: jsonData)
 print(user.name)
 print(user.phoneNum)
 print(user.subjects)
 } catch {
 print(error.localizedDescription)
 }
 */


/* MARK: - inout working
 
 var testString: String = "Test String"
 
 func checkInoutWorking(_ oldString: inout String) -> String {
 oldString = "Test String Changed"
 return oldString
 }
 print(testString)
 print(checkInoutWorking(&testString))
 */


/* MARK: - Bubble Sort
 
 var arr: [Int] = [4, 8, 6, 5, 2]
 print(arr)
 for i in 0..<arr.count {
 for j in 0..<i {
 if arr[i] < arr[j] {
 arr.swapAt(i, j)
 }
 }
 }
 
 print(arr)
 */


/* MARK: - 2D Array Problem
 
 let matrix: [[Int]] = [
 [4, 7, 2, 4],
 [1, 6, 7],
 [8, 9 ,6]
 ]
 
 func isValid(_ arr: [Int], _ index: Int) -> Bool {
 return arr.indices.contains(index)
 }
 
 func getMaxSum() {
 var maxSum = 0
 for rowIndex in 0...(matrix.count - 3) {
 var i = 0
 while isValid(matrix[rowIndex], i + 2) {
 let firstRow = matrix[rowIndex]
 let secondRow = matrix[rowIndex + 1]
 let thirdRow = matrix[rowIndex + 2]
 let localSum: Int = firstRow[i] + firstRow[i + 1] + firstRow[i + 2] + secondRow[i + 1] + thirdRow[i] + thirdRow[i+1] + thirdRow[i+2]
 print("Local - ", localSum)
 maxSum = max(maxSum, localSum)
 i += 1
 }
 }
 print(maxSum)
 }
 
 getMaxSum()
 */


/* MARK: - Mutating func
 
 struct StepCounter {
 var steps = 0
 
 mutating func callAsFunction(count: Int) -> Bool {
 steps = count
 print(steps)
 return steps > 10_000
 }
 }
 
 var steps = StepCounter()
 let targetReached = steps.callAsFunction(count: 10)
 print(steps.steps)
 */


/* MARK: - Sync queue
 
 let queue = DispatchQueue(label: "main", qos: .userInteractive)
 queue.sync {
 print(1)
 print(2)
 }
 */


/* MARK: - Block operation
 
 class Execution {
 
 // Managing tasks with OperationQueue
 func executeTaskWithOperation()  {
 
 let t1 = BlockOperation {
 for i in 0...10 {
 print("~~> Task 1 Executing ..", i)
 sleep(1)
 }
 print("Task 1 completed")
 }
 
 let t2 = BlockOperation {
 for i in 0...10 {
 print("==> Task 2 Executing ..", i)
 sleep(1)
 }
 print("Task 2 Completed")
 }
 
 let successBlock = BlockOperation {
 print("Tasks Completed")
 }
 
 let oper = OperationQueue()
 
 t2.addDependency(t1)  // Remove this to see concurrent exec of t1 and t2
 successBlock.addDependency(t2)
 successBlock.addDependency(t1)
 
 oper.addOperations([t2, successBlock, t1], waitUntilFinished: true)
 
 }
 }
 
 let e = Execution()
 e.executeTaskWithOperation()
 */

/* MARK: - LeetCode
 
 var num: [Int] = [2, 7, 11, 15, 5, 5]
 let target: Int = 10
 var result: [Int] = []
 
 for i in num.indices {
 for j in i+1..<num.count {
 if num[i] + num[j] == target {
 result.append(i)
 result.append(j)
 break;
 }
 }
 }
 
 print(result)
 */

/// input "abcabcbb"
//func lengthOfLongestSubstring(_ s: String) -> Int {
//    var result: String = ""
//    var max: Int = -1
//    var count: Int = 0
//    for char in s {
//        print(result, char, count)
//        count += 1
//        print(count)
//        if result.contains(char) {
//            result = result.replacingOccurrences(of: "\(char)", with: "")
//            result.append(char)
//            max = max > (count - 1) ? max : (count - 1)
//            count = result.count
//            print("----------", result, char, count, max)
//            continue
//        }
//        result.append(char)
//    }
//
//    return max == -1 ? result.count : max > count ? max : count
//}

//func lengthOfLongestSubstring(_ s: String) -> Int {
//    let array = Array(s)
//    var hashMap = [Character:Int]()
//    var maxSubArray = [Int]()
//    var count = 0
//    for element in array {
//        print(hashMap, maxSubArray, count)
//        if hashMap[element] == nil {
//            hashMap[element] = 1
//             count += 1
//        } else {
//            count += 1
//            if count > 1 {
//                count = 0
//                print(hashMap)
//                maxSubArray.append(hashMap.count)
//                hashMap = [Character:Int]()
//            }
//        }
//    }
//    print(hashMap)
//    maxSubArray.append(hashMap.count)
//    return maxSubArray.max() ?? 0
//}

//func lengthOfLongestSubstring(_ s: String) -> Int {
//
//    var str: [Character] = Array(s)
//    var hashMap: [Character: Int] = [:]
//    var max: Int = -1
//    var count: Int = 0
//    let size = str.count
//    var result: String = ""
//
//    for index in 0..<size {
//        print(count, max)
//        let char = str[index]
//        count += 1
//        result.append(char)
//        if hashMap[char] == nil {
//            hashMap[char] = index
//        } else {
//            let tempInd = hashMap[char]!
//            print("----", index, tempInd)
//            hashMap[char] = index
//            result = String(result.dropFirst(tempInd + 1))
//            print(result)
//            max = max > (count) ? max : (count)
//            count = index - (tempInd + 1)
//        }
//    }
//    print(result)
//    return max > count ? max : count
////    return hashMap.count
//}

//func lengthOfLongestSubstring(_ s: String) -> Int {
//
//    var hashMap: [Character: Int] = [:]
//    var maxLength: Int = 0
//    var lastRepeatPosi: Int = -1
//    var i: Int = 0
//
//    for char in s {
//        if hashMap[char] != nil && (hashMap[char]! > lastRepeatPosi) {
//            lastRepeatPosi = hashMap[char]!
//        }
//        maxLength = max(i - lastRepeatPosi, maxLength)
//
//        print(i, lastRepeatPosi, maxLength)
//
//        hashMap[char] = i
//        i += 1
//    }
//    return maxLength
//}
//
//print("Answer = ", lengthOfLongestSubstring(" "))

//func calculateMedian(_ a: Int, _ b: Int) -> Double {
//    let x = Double(a + b)
//    return Double(x/2)
//}
//
//func commonLogicMedian(_ first: Int?, _ last: Int?, _ count: Int?) -> Double? {
//    if count! % 2 == 0 {
//        return calculateMedian(first!, last!)
//    } else if count! == 1 {
//        return Double(last!)
//    } else {
//        return nil
//    }
//}
//
//func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
//
//
//    var first: Int?
//    var last: Int?
//    var count: Int?
//
//
//    if nums1.last == nil {
//        first = nums2.first!
//        last = nums2.last!
//        count = nums2.count
//        guard let result = commonLogicMedian(first, last, count) else {
//            return Double(nums2[(count! / 2)])
//        }
//        return result
//    } else if nums2.last == nil {
//        first = nums1.first!
//        last = nums1.last!
//        count = nums1.count
//        guard let result = commonLogicMedian(first, last, count) else {
//            return Double(nums1[(count! / 2)])
//        }
//        return result
//    } else if nums1.count % 2 == 0 && nums2.count % 2 == 0 {
//        return calculateMedian(nums1.last!, nums2.first!)
//    } else {
//        return nums1.last! < nums2.first! ? Double(nums1.last!)  : Double(nums2.first!)
//    }
//
////    guard let last1 = nums1.last else { return Double(nums2.first!) }
////    guard let first2 = nums2.first else { return Double(nums1.last!) }
////    return nums1.last! < nums2.first! ? Double(nums1.last!)  : Double(nums2.first!)
//}
//
//findMedianSortedArrays([2, 3], [1])

//func singleNumber(_ nums: [Int]) -> Int {
//    var hashMap: [Int: Int] = [:]
//    for num in nums {
//        if hashMap[num] != nil {
//            hashMap.removeValue(forKey: num)
//        } else {
//            hashMap[num] = 1
//        }
//    }
//    return Int(hashMap.keys.first!)
//}

///Best solution
//func singleNumber(_ nums: [Int]) -> Int {
//    guard var s = nums.first else { return -1 }
//    for i in 1..<nums.count {
//        print(s)
//        s ^= nums[i]
//    }
//    return s
//}
//
//print(singleNumber([4, 1, 2, 1, 2]))

//func isHappy(_ n: Int) -> Bool {
//    var flag: Bool = false
//    var num: Int = n
//    while num != 1 {
//
//    }
//    return true
//}
//
//print(isHappy(19))


//func calculateMid(_ a: Int, _ b: Int) -> Int {
//    return (a + b) / 2
//}
//
//func search(_ nums: [Int], _ target: Int) -> Int {
//    var head: Int = 0
//    var tail: Int = nums.count - 1
//    let result: Int = -1
//    var count = 0
//    while result == -1 {
//        if count == 20 {
//            return -1
//        }
//        let mid = calculateMid(head, tail)
//        print(head, tail ,mid)
//        if head >= tail {
//            return -1
//        } else if nums[head] == target {
//            return head
//        } else if nums[tail] == target {
//            return tail
//        } else if target <= nums[mid] {
//            if target < nums[head] || target < nums[tail] {
//                head = mid
//            } else if target > nums[head] || target > nums[tail] {
//                tail = mid
//            }
//        } else if target > nums[mid] {
//            if target < nums[tail] || target > nums[head] || target < nums[head] {
//                head = mid
//            } else if target > nums[tail] {
//                tail = mid
//            }
//        }
//        count += 1
//    }
//
//    while result == -1 {
//        let mid = calculateMid(head, tail)
//        if nums[head] == target {
//            return head
//        } else if nums[tail] == target {
//            return tail
//        } else if nums[mid] == target {
//            return mid
//        } else if target > nums[head] && target < nums[mid] {
//            tail = mid
//        } else if target > nums[head] && target < nums[tail] {
//            head = mid
//        }
//        print(head, tail , mid)
//        count += 1
//        if count == 10 {
//            return -1
//        }
//    }
//}
//
//print(search([4,5,6,7,0,1,2], 0))

//struct KRProduct {
//    var upc: Int
//    var name: String
//}
//
//enum StateEnum {
//    case added
//    case removed
//    case updated
//}
//
//class Regulars {
//
//    var upc: Int
//    var name: String
//    var quantity: Float = 99
//
//    var stateEnum: StateEnum = .added
//
//    init(upc: Int = 0, name: String = "asd", quantity: Float = 99) {
//        self.name = name
//        self.quantity = quantity
//        self.upc = upc
//    }
//}
//
//func getRegularList(completion: @escaping ([Regulars]?) -> Void) {
//    DispatchQueue.main.async {
//        let regular1 = Regulars(upc: 1, name: "a", quantity: 99)
//        let regulars2 = Regulars(upc: 2, name: "b", quantity: 99)
//        let regulars3 = Regulars(upc: 3, name: "c", quantity: 99)
//
//        completion([regular1, regulars2, regulars3])
//    }
//}
//
//
//func set(quantity: Float, for product: KRProduct) {
//    getRegularList { regulars in
//        guard var regulars = regulars else { return }
//        if let item = regulars.first(where: { $0.upc == product.upc }) {
//            item.quantity = quantity
//            if item.stateEnum != .added {
//                item.stateEnum = .updated
//            }
//            if item.quantity == 0 {
//                item.stateEnum = .removed
//            }
////            self.saveRegulars(regulars: regulars)
////            return
//        } else {
//            let storedItem = Regulars()
//            storedItem.quantity = quantity
//            storedItem.upc = product.upc
//            storedItem.stateEnum = .added
//            regulars.append(storedItem)
////            self.saveRegulars(regulars: regulars)
//        }
//
//        for regular in regulars {
//            print(regular.quantity)
//        }
//        return
//    }
//}
//
//set(quantity: 123, for: KRProduct(upc: 2, name: "b"))
//getRegularList { regulars in
//    print(regulars![1].quantity)
//}

//let queue = OperationQueue()
//queue.name = "RockPunk"
//queue.maxConcurrentOperationCount = 1
//queue.qualityOfService = .default
//
//func a(completion: @escaping (String, Error?) -> Void) {
//    queue.addOperation {
//        print(1)
//        completion("A", nil)
//        print(2)
//    }
//}
//
//a { (asd, error) in
//    guard let error = error else {
//        print(asd)
//        return
//    }
//    print(error.localizedDescription)
//}


