Practice > Algorithms > Warmup > Mini-Max Sum


A.


import Foundation

// Complete the miniMaxSum function below.
func miniMaxSum(arr: [Int]) -> Void {
    
    var sortarr = arr
    sortarr.sort()
    var summin = 0
    var summax = 0
    for i in (0...3){
        summin += sortarr[i]
    }
    for j in (1...4){
        summax += sortarr[j]
    }
    var re = String(summin)+" "+String(summax)
    print(re)

}

guard let arrTemp = readLine() else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == 5 else { fatalError("Bad input") }

miniMaxSum(arr: arr)
