Practice > Algorithms > Implementation > Bon Appétit

/*
  n , k 
  bill[]
  b
  가 입력되었을때 
  bill.count = n이고 
  bill[k] 는 안나가 먹지 않은 음식으로 계산하지 않는다. 
  bill[k]를 뺀 나머지 음식들의 가격을 모두 더해 반띵 (/ 2) 를 해주고, 
  b - 나온금액 해서 0이하가 나오면 Bon Appetit 를 출력해 주면 된다.
*/

A..

import Foundation

// Complete the bonAppetit function below.
func bonAppetit(bill: [Int], k: Int, b: Int) -> Void {
    var sum = 0, re = 0

    for i in (0...bill.count-1){
        if i == k {
            continue
        }else{
            sum += bill[i]
        }
    }
    sum /= 2
    re = b - sum
    if re<=0 {
        print("Bon Appetit")
    }else{
        print(re)
    }


}

guard let nkTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let nk = nkTemp.split(separator: " ").map{ String($0) }

guard let n = Int(nk[0])
else { fatalError("Bad input") }

guard let k = Int(nk[1])
else { fatalError("Bad input") }

guard let billTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let bill: [Int] = billTemp.split(separator: " ").map {
    if let billItem = Int($0) {
        return billItem
    } else { fatalError("Bad input") }
}

guard bill.count == n else { fatalError("Bad input") }

guard let b = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

bonAppetit(bill: bill, k: k, b: b)
