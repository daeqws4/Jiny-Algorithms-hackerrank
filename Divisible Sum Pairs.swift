
Practice > Algorithms > Implementation > Divisible Sum Pairs


A.


import Foundation

// Complete the divisibleSumPairs function below.
func divisibleSumPairs(n: Int, k: Int, ar: [Int]) -> Int { 

/*
코드를 보면 2중 for문 을 이용해서 너무 간단하게 구현했다. 
먼저 2중 포문을 돌아 (0.0)(0.1)(0.2) 이런식으로 (x.y) 값이 들어오고
그 다음 조건문으로 x , y 가 다를때, 그리고 더해서 k의 배수 일때 카운트를 올린다. 
이렇게되면 문제가 (1.2) (2.1) 이렇게 두번 인식 된다는 것인데 마지막 리턴할 때 /2 만 해주면 해결된다.
*/
    var sum = 0,count = 0
    for x in (0..<n){
        for y in (0..<n){
            if (x != y && ((ar[x]+ar[y])%k == 0)) {
                count += 1
            }
        }
    }
    return (count/2)
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let nkTemp = readLine() else { fatalError("Bad input") }
let nk = nkTemp.split(separator: " ").map{ String($0) }

guard let n = Int(nk[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let k = Int(nk[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let arTemp = readLine() else { fatalError("Bad input") }
let ar: [Int] = arTemp.split(separator: " ").map {
    if let arItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arItem
    } else { fatalError("Bad input") }
}

guard ar.count == n else { fatalError("Bad input") }

let result = divisibleSumPairs(n: n, k: k, ar: ar)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
