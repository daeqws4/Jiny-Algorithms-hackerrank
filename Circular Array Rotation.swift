Practice > Algorithms > Implementation > Circular Array Rotation

A.

import Foundation

//초기화
var a = [1,2,3,4,5,6]
var queries = [0,1,2,3,4,5,6]
var k = 8
var re : [Int] = []
var count = k % a.count

//loop queries.count 만큼 돌리고 re에 append시켜줌
for i in (0..<queries.count){
    var j = queries[i]+(a.count-count)
    if j >= (a.count-1) {
        j = j % (a.count)
    }
    re.append(a[j])
}
print(re)
    
