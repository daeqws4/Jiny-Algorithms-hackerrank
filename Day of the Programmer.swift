Practice > Algorithms > Implementation > Day of the Programmer

A.


import Foundation

// Complete the dayOfProgrammer function below.

func dayOfProgrammer(year: Int) -> String {

    // 윤년을 구분하는 배열을 생성
    var dayArr = [[31,28,31,30,31,30,31,31,30,31,30,31],[31,29,31,30,31,30,31,31,30,31,30,31]]
    // 윤년을 구분해서 사용할 배열을 넣어주는 배열 생성
    var dayAr : [Int] = []
    // 년도와 256번째를 카운팅하기위한 카운트, 월을 초기화해준다.
    var count = 256, month = 0,strmonth = ""

    // 윤년인지 구분하는 계산은 년도를 4로 나눠서 나머지가 1이면 윤년으로 처리했다.
    if year%4 == 1 {
        dayAr = dayArr[0]
    }else {
        dayAr = dayArr[1]
    }

    /*
        반복문으로 1월부터 12월까지의 날짜들이 카운트에서 - 된다. 음수값이 출력되면 마지막 - 을 다시 + 해준뒤 마지막달을 저장
        반복문이 0부터 시작되기때문에 조건문위 카운트 위에 있다. 그리고 count 가 음수가 되었던 마지막 달을 다시 더해주면 날짜가 나온다.
    */

    for i in (0..<12) {
        if(count < 0){
            month = i
            count = count + dayAr[i-1]
            break
        }
        count = count - dayAr[i]
    }
    /*
        day에도 해줘야하는 처리인데, 해당사항없어서 month에만 적용했다. 문자열로 바꿔서 두글자가 아니면 0을 붙여준다.
    */
    strmonth = String(month)
    if strmonth.count < 2 {
        strmonth = "0" + strmonth
    }
    return(String(count)+"."+strmonth+"."+String(year))
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let year = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let result = dayOfProgrammer(year: year)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
