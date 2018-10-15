Practice  > Algorithms > Implementation > Grading Students

A.

import Foundation

/*
 * Complete the gradingStudents function below.
 */
func gradingStudents(grades: [Int]) -> [Int] {
    /*
     * Write your code here.
     * 변수의 이름을 너무 헷갈리게 선언했지만, 너무 간단한 코드다.
     * for문에서 하나씩 변수를 가지고오면 5단위로 반올림을 먼저해주고
     * 38미만인 숫자는 다시 원래숫자인 i를 넣어줬다.
     * 38이상인 숫자만 5단위로 반올림 해줘라 가 더 깔끔한 코드가 될것같다. 
     */

    let a = grades
    var re : [Int] = []
    var j = 0

    for i in a{
        j = i
        if(i%5 != 0){
            if(i%5 > 2){
                j = j + (5 - i%5)
            }
        }
        if(i < 38){
            j = i
        }
        re.append(j)
    }

    return re
}

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let grades: [Int] = AnyIterator{ readLine() }.prefix(n).map {
    if let gradesItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return gradesItem
    } else { fatalError("Bad input") }
}

guard grades.count == n else { fatalError("Bad input") }

let result = gradingStudents(grades: grades)

fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
