//
//  File.swift
//  SDSSwiftExtension
//
//  Created by Tomoaki Yagishita on 2026/05/20.
//

import Foundation

@available(macOS 15.0, iOS 18.0, *)
extension RangeSet {
    @available(macOS 15.0, iOS 18.0, *)
    public var gapRangeSet: RangeSet {
        #if USEMYOWN
        var rangeSet = RangeSet()
        // note: for the moment, expect elements in rangeSet do not have overlap
        var ite = PairIterator(self.ranges)
        while let (current, next) = ite.next() {
            guard let next = next else { break }
            if current.upperBound < next.lowerBound {
                rangeSet.insert(contentsOf: current.upperBound..<next.lowerBound)
            }
        }
        return rangeSet
        #else
        let sorted = self.ranges.sorted(by: { $0.lowerBound < $1.lowerBound })
        guard let start = sorted.first?.lowerBound,
              let end = sorted.last?.upperBound else { return RangeSet() }
        return RangeSet(start..<end).subtracting(self)
        #endif
    }
}
