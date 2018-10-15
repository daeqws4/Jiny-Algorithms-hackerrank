Practice > Algorithms > Warmup > Compare the Triplets

A.

import Foundation

// Complete the compareTriplets function below.
/*
  a 와 b 를 순서대로 비교하여 초기화해줬던 acount와 bcount에 +1해주는 함수이다.
*/
func compareTriplets(a: [Int], b: [Int]) -> [Int] {
    var acount = 0
    var bcount = 0
    var re : [Int] = []
    for i in (0..<3){
        if(a[i] < b[i]) {
            bcount += 1
        }
        else if(a[i] > b[i]) {
            acount += 1
        }
    }
re.append(acount)
re.append(bcount)
return (re)

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let aTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let a: [Int] = aTemp.split(separator: " ").map {
    if let aItem = Int($0) {
        return aItem
    } else { fatalError("Bad input") }
}

guard a.count == 3 else { fatalError("Bad input") }

guard let bTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let b: [Int] = bTemp.split(separator: " ").map {
    if let bItem = Int($0) {
        return bItem
    } else { fatalError("Bad input") }
}

guard b.count == 3 else { fatalError("Bad input") }

let result = compareTriplets(a: a, b: b)

fileHandle.write(result.map{ String($0) }.joined(separator: " ").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
