# SDSSwiftExtension

convenient extension for Swift 

## DictionaryWithDefault
dictionary type having default value inside


## PairIterator
### functionality
from Collection, PairIterator will return paired element

collection: [1,2,3,4,5]

PairIterator will return (1,2), (2,3), (3,4), (4,5), (5,nil), nil


collection: [1,2]

PairIterator will return (1,2), (2,nil), nil

collection: [1]

PairIterator will return (1,nil), nil

collection: []

PairIterator will return nil

same as standard iterator, nil means end of elements.
before end of elements, pairIterator will return (lastElement, nil)

this would make it easy to iterate pairs in the collection.

### example code
```
let array = [.......]
var iterator = PairIterator(array)
while let (current, next) = iterator.next() {
   // process something
   if next == nil {
     // this iteration is last iteration
   }
}
```

## Array subscript
note: may be extended to Sequence
### [safe: index]
return nil if index is out of boudns

array = [0,1,2,3,4]

array[safe: 5] will return nil

### [loop: index]
return element at index with considering array is looped

array = [0,1,2,3,4]

array[loop:6] will return array[1] i.e. 1

## Duration / TimeInterval conversion (macOS13/iOS16 or later)
convert between Duration and TimeInterval
```
let duration = Duration.seconds(5)
let timeInterval = duration.timeInteval
```

```
let timeInterval: TimeInterval = 5
let duration = Duration(timeInterval: timeInterval)
```
