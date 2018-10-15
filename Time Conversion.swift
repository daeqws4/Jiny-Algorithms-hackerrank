Practice > Algorithms > Warmup > Time Conversion

A.

import Foundation

/*
 * Complete the timeConversion function below.
 */
func timeConversion(s: String) -> String {
    /*
     * Write your code here.
     * 스트링을 받아 먼저 문자열을 없애주고, : 를 기준으로 split을 해줬다. 
     * 문자열을없앤이유는 int 배열로 만들고 싶었기 때문. 그래야 +12할때 편해보였다. 
     * 기존의 문자에서 am인지 pm인지 판단하여 조건을 주고 마지막엔 배열을 :로 조인해주고 리턴하면 ok
     */
    var text = s
    var time = text.trimmingCharacters(in: ["A","P","M"])
    var arrRow = time.split {$0 == ":"}
    var intArray = arrRow.map { Int($0)!}
    if text.contains("PM") {
        intArray[0] += 12
        if intArray[0] == 24 {
            intArray[0] = 12
        }
    }
    if text.contains("AM") {
        if intArray[0] == 12 {
            intArray[0] = 0
        }
    }
    var strArray = intArray.map { String($0)}
    for i in (0..<strArray.count){
        if strArray[i].count == 1 {
            strArray[i] = "0" + strArray[i]
        }
    }
    return (strArray.joined(separator: ":"))


}

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let s = readLine() else { fatalError("Bad input") }

let result = timeConversion(s: s)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
