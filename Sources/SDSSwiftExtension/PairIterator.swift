//
//  PairIterator.swift
//
//  Created by : Tomoaki Yagishita on 2022/10/10
//  © 2022  SmallDeskSoftware
//

import Foundation

public struct PairIterator<C:Collection>{
    let collection: C
    var currentIterator: C.Iterator
    var nextIterator: C.Iterator

    public init(_ collection: C) {
        self.collection = collection
        currentIterator = collection.makeIterator()
        nextIterator = collection.makeIterator()
        _ = nextIterator.next()
    }

    public mutating func next() -> (C.Element, C.Element?)? {
        guard let current = currentIterator.next() else { return nil }
        let next = nextIterator.next()
        return (current, next)
    }
}

extension Array {
    public func makePairIterator() -> PairIterator<Array> {
        return PairIterator(self)
    }
}
