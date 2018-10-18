Practice > Algorithms > Implementation > Electronics Shop

A.

import Foundation

/*
 * Complete the getMoneySpent function below.
 */
func getMoneySpent(keyboards: [Int], drives: [Int], b: Int) -> Int {
    /*
     * 키보드를 k , 드라이브를 d로 for문 에 받아서 합이 b보다 작고, max보다 클때 max에 입력해두고 
     * 마지막에 max를 출력한다. 
     */

    var max = -1

    for k in keyboards {
        for d in drives {
            if (k+d) <= b && max < (k+d) {
                max = (k+d)
            }
        }
    }
    return(max)

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let bnmTemp = readLine() else { fatalError("Bad input") }
let bnm = bnmTemp.split(separator: " ").map{ String($0) }

guard let b = Int(bnm[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let n = Int(bnm[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let m = Int(bnm[2].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let keyboardsTemp = readLine() else { fatalError("Bad input") }
let keyboards: [Int] = keyboardsTemp.split(separator: " ").map {
    if let keyboardsItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return keyboardsItem
    } else { fatalError("Bad input") }
}

guard keyboards.count == n else { fatalError("Bad input") }

guard let drivesTemp = readLine() else { fatalError("Bad input") }
let drives: [Int] = drivesTemp.split(separator: " ").map {
    if let drivesItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return drivesItem
    } else { fatalError("Bad input") }
}

guard drives.count == m else { fatalError("Bad input") }

/*
 * The maximum amount of money she can spend on a keyboard and USB drive, or -1 if she can't purchase both items
 */

let moneySpent = getMoneySpent(keyboards: keyboards, drives: drives, b: b)

fileHandle.write(String(moneySpent).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
