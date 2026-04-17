//
//  ClosedRange+Extension.swift
//  SDSSwiftExtension
//
//  Created by Tomoaki Yagishita on 2024/12/02.
//

import Foundation

extension ClosedRange {
    public func extend(to newValue: Bound) -> ClosedRange {
        if newValue < self.lowerBound {
            return newValue...self.upperBound
        } else if self.upperBound < newValue {
            return self.lowerBound...newValue
        }
        return self
    }
}

extension ClosedRange where Bound == Double {
    public func ratio(for value: Bound) -> Bound {
        return (value - self.lowerBound) / (self.upperBound - self.lowerBound)
    }
    public func value(from ratio: Bound) -> Bound {
        return self.lowerBound + (self.upperBound - self.lowerBound) * ratio
    }
    public func stride(step: Bound) -> StrideThrough<Bound> {
        return Swift.stride(from: self.lowerBound, through: self.upperBound, by: step)
    }
}
