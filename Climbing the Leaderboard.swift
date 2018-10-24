Practice > Algorithms > Implementation > Climbing the Leaderboard

A.

import Foundation

// Complete the climbingLeaderboard function below.
func climbingLeaderboard(scores: [Int], alice: [Int]) -> [Int] {
    var re : [Int] = []

    for i in (0..<alice.count) {
        for j in (0..<scores.count) {
            if alice[i] < scores[j] {
                re.append(scores.count-j+1)
                break
            }else if alice[i] == scores[j] {
                re.append(scores.count-j)
                break
            }else if alice[i] > scores[scores.index(before: scores.endIndex)]{
                re.append(1)
                break
            }
        }
    }
    return re
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let scoresCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let scoresTemp = readLine() else { fatalError("Bad input") }
let scores: [Int] = scoresTemp.split(separator: " ").map {
    if let scoresItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return scoresItem
    } else { fatalError("Bad input") }
}
var sortscores = Array(Array(Set(scores)).sorted())

guard scores.count == scoresCount else { fatalError("Bad input") }

guard let aliceCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let aliceTemp = readLine() else { fatalError("Bad input") }
let alice: [Int] = aliceTemp.split(separator: " ").map {
    if let aliceItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return aliceItem
    } else { fatalError("Bad input") }
}

guard alice.count == aliceCount else { fatalError("Bad input") }

let result = climbingLeaderboard(scores: sortscores, alice: alice)

fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
