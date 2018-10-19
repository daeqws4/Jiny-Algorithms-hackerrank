Practice > Algorithms > Implementation > Sequence Equation

A.

import Foundation

// Complete the permutationEquation function below.
func permutationEquation(p: [Int]) -> [Int] {

/*
  문제에 나와있는 식그대로 y를 모아서 return
*/
    var a = [0]
    a = a + p
    var re :[Int] = []
    for x in (1...p.count){
        for y in (1...p.count){
            if a[a[y]]==x{
                re.append(y)
            }
        }
    }
    return(re)

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let pTemp = readLine() else { fatalError("Bad input") }
let p: [Int] = pTemp.split(separator: " ").map {
    if let pItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return pItem
    } else { fatalError("Bad input") }
}

guard p.count == n else { fatalError("Bad input") }

let result = permutationEquation(p: p)

fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
