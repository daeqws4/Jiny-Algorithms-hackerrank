Practice > Algorithms > Implementation > Counting Valleys



/*
처음 1에서시작해서  score1을 계속이동한다. 
그리고 score2에는 계산이 끝난후의 score1을 저장하니까 다음 for문이 돌때는 이전개리의 높이를 가지고있다. 
즉, 이전개리의높이가 1이였는데 0으로 떨어지는 순간을 count하면 된다. 
*/
A.

import Foundation

// Complete the countingValleys function below.
func countingValleys(n: Int, s: String) -> Int {
    var count = 0, score1 = 1, score2 = 1
    for i in s {
        if i == "U" {
            score1 += 1
        }else {
            score1 -= 1
        }
        if score1 < 1 && score2 == 1 {
            count += 1
        }
        score2 = score1
    }
    return(count)

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let s = readLine() else { fatalError("Bad input") }

let result = countingValleys(n: n, s: s)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
