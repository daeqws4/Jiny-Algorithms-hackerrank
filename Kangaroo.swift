Practice > Algorithms > Implementation > Kangaroo


/*
x1 v1 x2 v2 순으로 입력이 들어오고.
출발지점에서의 차이를 abs() 를 이용해서 절댓값을 구해둔다.
이후 while문을 돌리면서 v를 더하고 비교 더하고 비교 해서 같아지면 yes를
점점 더 멀어지거나 출발지점에서의 차이와 같으면 NO를 리턴한다.
*/
A.

import Foundation

// Complete the kangaroo function below.
func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
    var x = abs(x1 - x2)
    var st1 : Int = x1 , st2 : Int = x2
    var re = ""
    while(true){
        st1 = st1 + v1
        st2 = st2 + v2
        if(st1 == st2){
            re = "YES"
            break
        }
        if(abs(st1 - st2) >= x){
            re = "NO"
            break
        }
    }
    return re
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let x1V1X2V2Temp = readLine() else { fatalError("Bad input") }
let x1V1X2V2 = x1V1X2V2Temp.split(separator: " ").map{ String($0) }

guard let x1 = Int(x1V1X2V2[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let v1 = Int(x1V1X2V2[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let x2 = Int(x1V1X2V2[2].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let v2 = Int(x1V1X2V2[3].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

let result = kangaroo(x1: x1, v1: v1, x2: x2, v2: v2)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
