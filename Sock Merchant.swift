Practice > Algorithms > Implementation > Sock Merchant

A.

import Foundation

// Complete the sockMerchant function below.
func sockMerchant(n: Int, ar: [Int]) -> Int {
    var dict : [Int:Int] = [:]
    var count = 0

    //dict형에 업데이트해줄 함수 key에대한 value가 없으면 1을 반환, 있으면 +1해준뒤 반환
    func dictset(i:Int) -> Int{
        if(dict[i]==nil){
            return 1
        }else{
            return(dict[i]!+1)
        }
    }
    // loop를 돌면서 array를 dict형으로 변환( 빈도수만큼 체크 )
    for i in ar {
        dict.updateValue(dictset(i: i), forKey: i)
    }

    // dict에서 value값을 체크해서 count를 올려줌, 한쌍에 +1
    for (_,value) in dict {
        if value/2 > 0 {
            count += value/2
        }
    }

    // count 반환 (몇쌍인지 나옴)
    return (count)

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arTemp = readLine() else { fatalError("Bad input") }
let ar: [Int] = arTemp.split(separator: " ").map {
    if let arItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arItem
    } else { fatalError("Bad input") }
}

guard ar.count == n else { fatalError("Bad input") }

let result = sockMerchant(n: n, ar: ar)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
