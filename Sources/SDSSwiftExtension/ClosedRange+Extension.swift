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
