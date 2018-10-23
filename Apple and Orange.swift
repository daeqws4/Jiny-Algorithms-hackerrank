Practice > Algorithms > Implementation > Apple and Orange

A.

import Foundation

// Complete the countApplesAndOranges function below.
// 나무좌표에서 사과가 떨어진 배열, 오렌지가떨어진 배열을 계산해서 그 값이 집 구간에 있는지 검사하면 된다.
func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {
    var count = 0

    for i in (0..<apples.count){
        if s <= a+apples[i] && t >= a+apples[i] {
            count += 1
        }
    }
    print(count)
    count = 0
    for i in (0..<oranges.count){
        if s <= b+oranges[i] && t >= b+oranges[i]{
            count += 1
        }
    }
    print(count)

}

guard let stTemp = readLine() else { fatalError("Bad input") }
let st = stTemp.split(separator: " ").map{ String($0) }

guard let s = Int(st[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let t = Int(st[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let abTemp = readLine() else { fatalError("Bad input") }
let ab = abTemp.split(separator: " ").map{ String($0) }

guard let a = Int(ab[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let b = Int(ab[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let mnTemp = readLine() else { fatalError("Bad input") }
let mn = mnTemp.split(separator: " ").map{ String($0) }

guard let m = Int(mn[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let n = Int(mn[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let applesTemp = readLine() else { fatalError("Bad input") }
let apples: [Int] = applesTemp.split(separator: " ").map {
    if let applesItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return applesItem
    } else { fatalError("Bad input") }
}

guard apples.count == m else { fatalError("Bad input") }

guard let orangesTemp = readLine() else { fatalError("Bad input") }
let oranges: [Int] = orangesTemp.split(separator: " ").map {
    if let orangesItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return orangesItem
    } else { fatalError("Bad input") }
}

guard oranges.count == n else { fatalError("Bad input") }

countApplesAndOranges(s: s, t: t, a: a, b: b, apples: apples, oranges: oranges)
