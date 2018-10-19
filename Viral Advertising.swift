Practice > Algorithms > Implementation > Viral Advertising

A.
/*
  광고. 무슨 바이러스같은데... 
  여튼 처음시작할때 5명에게 전달해서 시작하고 
  이중에 절반은 좋아한다. 그래서 좋아하는사람은 꼭 3명에게 다시 전파하고 그럼또 절반은 좋아서 3명에게 다시 전파하고.. 
  이런식이다 몇일(입력받은날) 됫을때 총 좋아했던 사람의 수를 구하는것인데.
 처음시작이 st 5명
  좋다고한사람이 2명
  그리고 좋은사람 누적이 2명 이렇게 시작하여.. 쭉.. 
  포문으로 계산하는문제.
*/

import Foundation

// Complete the viralAdvertising function below.
func viralAdvertising(n: Int) -> Int {
    
    var st = 5, like = 2, sum = 2
    if n != 1 {
        for i in (2...n){
            st = like * 3
            like = st/2
            sum += like
        }
    }
    return(sum)

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let result = viralAdvertising(n: n)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
