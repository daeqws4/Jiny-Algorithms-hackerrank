Practice > Algorithms > Implementation > Breaking the Records

A.

import Foundation

// Complete the breakingRecords function below.
func breakingRecords(scores: [Int]) -> [Int] {

/*
  받아온 배열에서 0번째를 HS와 LS에 초기화해준뒤 변화할때마다 count를 올려준다. 
  마지막 리턴할때 count를 배열에 담아 리런하면 끝.
*/

    var HS = scores[0], HScount = 0
    var LS = scores[0], LScount = 0

    var reArr : [Int] = []

    for i in scores{
    
        if(i>HS){
            HS = i
            HScount += 1
        }else if(i<LS){
            LS = i
            LScount += 1
        }
    }
    reArr.append(HScount)
    reArr.append(LScount)

    return reArr

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let scoresTemp = readLine() else { fatalError("Bad input") }
let scores: [Int] = scoresTemp.split(separator: " ").map {
    if let scoresItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return scoresItem
    } else { fatalError("Bad input") }
}

guard scores.count == n else { fatalError("Bad input") }

let result = breakingRecords(scores: scores)

fileHandle.write(result.map{ String($0) }.joined(separator: " ").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
