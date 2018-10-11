Practice > Algorithms > Warmup > Staircase

A.



import Foundation

// Complete the staircase function below.
func staircase(n: Int) -> Void {

    var m = n

    for i in (1...n){
        var sp = ""
        m -= 1
        for j in (0..<m){
            sp = sp+" "
        }
        for k in (1...i){
            sp = sp + "#"
        }
        print(sp)
    }

}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

staircase(n: n)
