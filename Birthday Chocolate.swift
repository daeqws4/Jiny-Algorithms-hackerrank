Practice > Algorithms > Implementation > Birthday Chocolate

/*

포문에 배열을 하나씩 가지고와서 
새로운 Arr 배열에 m개를 받아온다. 
그런뒤 m개가 모두 채워지면 다더해서 d값이 되는지 확인하고
Arr배열에 0번째 수를 지워줌
그럼 m개가 안되니까 새로운 숫자를 append로 받아온다. 
이렇게 계속 받아오고 비교 지우고 받아오고 비교 지우고 반복하면 reCount에 숫자가 쌓이고 
리턴해주면 끝.

*/

A.

import Foundation

// Complete the birthday function below.
func birthday(s: [Int], d: Int, m: Int) -> Int {
    var Arr :[Int] = []
    var reCount = 0

    for i in s{
        if Arr.count < m {
            Arr.append(i)
        }
        if Arr.count == m {
            var sum = 0
            for i in Arr {
                sum += i
            }
            if sum == d {
                reCount += 1
            }
            Arr.remove(at: 0)
        }
    }
    return (reCount)

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let sTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let s: [Int] = sTemp.split(separator: " ").map {
    if let sItem = Int($0) {
        return sItem
    } else { fatalError("Bad input") }
}

guard s.count == n else { fatalError("Bad input") }

guard let dmTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let dm = dmTemp.split(separator: " ").map{ String($0) }

guard let d = Int(dm[0])
else { fatalError("Bad input") }

guard let m = Int(dm[1])
else { fatalError("Bad input") }

let result = birthday(s: s, d: d, m: m)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
