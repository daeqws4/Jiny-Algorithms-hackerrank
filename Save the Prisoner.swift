Practice > Algorithms > Implementation > Save the Prisoner!

A.

import Foundation
/*
  (시작하는카운트 - 1) + 과자갯수) % 죄수 수 해주면되고 
  값이 0 일때는 그냥 죄수수를 출력해주면끝난다.
*/

func saveThePrisoner(n: Int, m: Int, s: Int) -> Int {
    if( ((s-1)+m) % n ) == 0 {
        return n
    }else {
        return( ((s-1)+m) % n )
    }


}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for tItr in 1...t {
    guard let nmsTemp = readLine() else { fatalError("Bad input") }
    let nms = nmsTemp.split(separator: " ").map{ String($0) }

    guard let n = Int(nms[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    guard let m = Int(nms[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    guard let s = Int(nms[2].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    let result = saveThePrisoner(n: n, m: m, s: s)

    fileHandle.write(String(result).data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
