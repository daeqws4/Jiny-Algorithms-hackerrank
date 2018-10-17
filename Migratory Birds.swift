Practice > Algorithms > Implementation > Migratory Birds

A.

import Foundation
var countDict : [Int:Int] = [:]

func clear(i : Int) -> Int {
        if(countDict[i]==nil){
            return 1
        }else{
            return (countDict[i]!+1)
        }
    }

// Complete the migratoryBirds function below.
func migratoryBirds(arr: [Int]) -> Int {

    var count = 0, max = 0, re : [Int] = []
    // i의 빈도수를 Dict에 저장
    for i in arr{
        // clear함수는 update를 진행하며 key에 해당하는 value가 nil값이면 1을 nil이 아니면 값에 +1을 해줌.
        countDict.updateValue(clear(i: i), forKey: i)
    }
    // Dict에서 하나씩 꺼내 value 값이 높은 놈을 선별
    for i in countDict{
        if i.value > max {
            max = i.value
            count = 0
        }else if i.value == max {
            count += 1
        }
    }
    // count가 1이상이면 value값에 해당하는 key를 리스트로 저장
    for i in countDict{
        if i.value == max {
            re.append(i.key)
        }
    }
    // 소금친 배열의 첫번째 숫자를 받아옴
    return (re.sorted()[0])


}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let arrCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == arrCount else { fatalError("Bad input") }

let result = migratoryBirds(arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
