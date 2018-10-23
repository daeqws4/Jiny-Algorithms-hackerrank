Practice > Algorithms > Implementation > The Hurdle Race

A.

import Foundation

// Complete the hurdleRace function below.
func hurdleRace(k: Int, height: [Int]) -> Int {
    var a = height.sorted()
    var re = 0
    var max = a.popLast()!

    if max - k > 0 {
        re = max - k
    }

    return(re)

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

guard let heightTemp = readLine() else { fatalError("Bad input") }
let height: [Int] = heightTemp.split(separator: " ").map {
    if let heightItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return heightItem
    } else { fatalError("Bad input") }
}

guard height.count == n else { fatalError("Bad input") }

let result = hurdleRace(k: k, height: height)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
