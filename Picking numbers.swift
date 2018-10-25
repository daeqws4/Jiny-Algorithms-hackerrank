Practice > Algorithms > Implementation > Picking Numbers

A.

import Foundation

/*
 * Complete the 'pickingNumbers' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts INTEGER_ARRAY a as parameter.
 */

func pickingNumbers(a: [Int]) -> Int {
    // Write your code here
    // 필요한 변수, count 선언.
    var re : [Int] = []
    var count = 0

    var b = a.sorted()
    //loop를 돌려서 들어오는값과 원래 있는값으 차이가 1 이하이면 빈 배열에 append시켜줌. 아닐경우 기존의 배열을 count해서 기존의 count보다 크면 count에 담아주고, 배열은 초기화, 그리고 담아줌.
    for i in (0..<b.count-1) {
        re.append(b[i])
        for j in (i+1..<b.count) {
            if b[j]-re[0] <= 1 {
                re.append(b[j])
            }
        }
        if count < re.count {
            count = re.count
        }
        re.removeAll()
    }

    return(count)

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let aTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let a: [Int] = aTemp.split(separator: " ").map {
    if let aItem = Int($0) {
        return aItem
    } else { fatalError("Bad input") }
}

guard a.count == n else { fatalError("Bad input") }

let result = pickingNumbers(a: a)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
