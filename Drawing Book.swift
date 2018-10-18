Practice > Algorithms > Implementation > Drawing Book

A.

import Foundation

/*
 *  page를 보면 2로나눈 몫만큼의 위치를 가지고있다. 
    1 23 45 67 이런식으로 되어있으므로 2로나누면
    0 1 2 3 이런식이 된다는 말.

    시작하는위치의 페이지에서 입력받은 p위치까지 더짧은것만 return해주면 끝.
 */
 
func pageCount(n: Int, p: Int) -> Int {
    /*
     * Write your code here.
     */
    var num = 0

    num = (n/2)-(p/2)

    if num<p/2 {
        return(num)
    }else{
        return(p/2)
    }

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let p = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let result = pageCount(n: n, p: p)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
