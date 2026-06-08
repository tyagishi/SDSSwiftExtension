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
        let lower = ranges.map({ $0.lowerBound }).min()
        let upper = ranges.map({ $0.upperBound }).max()
        guard let start = lower,
              let end = upper else { return RangeSet() }
        return RangeSet(start..<end).subtracting(self)
        #endif
    }

    /// find gap-range from RangeSet
    /// - Parameter value: gap-range includes the value
    /// - Returns: gap-range iff exists
    public func findGapRange(includes value: Bound) -> Range<Bound>? {
        return gapRangeSet.ranges.first(where: { $0.contains(value) })
    }
}
