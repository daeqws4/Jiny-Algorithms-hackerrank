Practice > Algorithms > Implementation > Jumping on the Clouds

A.

var c = [0,0,1,0,0,1,0]
var count = 0
var zeroCount = 0
for i in (1..<c.count) {
    if c[i] == 0 {
        zeroCount += 1
        if c[i-1] == 1 {
            count += 1
            zeroCount = 0
            continue
        }
        if zeroCount == 2 {
            zeroCount = 0
            count += 1
            continue
        }
        if i == c.count-1 {
            count += 1
        }
    }else {
        if zeroCount == 1 {
            count += 1
        }
        zeroCount = 0
        
    }
}
print(count)
/*
Or
*/
var c = [0,0,0,1,0,0]
var count = 0
var zeroCount = 0

c.append(1)
for i in (1..<c.count) {
    if c[i] == 0 {
        if c[i-1] == 1 {
            count += 1
        }else {
            zeroCount += 1
        }
    }else {
        count += zeroCount/2
        count += zeroCount%2
        zeroCount = 0
    }
}
print(count)
