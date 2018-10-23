Practice > Algorithms > Implementation > Utopian Tree

A.

import Foundation

// Complete the utopianTree function below.
/*
  짝수일때는 +1 홀수일때는 *2를 해주는 for문을 작성해서 미리배열에 넣어놓고 
  꺼내올때 원하는위치에있는 값을 주면된다.
*/
func utopianTree(n: Int) -> Int {

    var Height : [Int] = [1]
    var h = 1

    for i in (1..<60){
        if i % 2 == 0 {
            h += 1
        }else{
            h *= 2
        }
        Height.append(h)
    }
    return(Height[n])
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for tItr in 1...t {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    let result = utopianTree(n: n)

    fileHandle.write(String(result).data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
