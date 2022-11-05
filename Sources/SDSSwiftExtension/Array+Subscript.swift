//
//  File.swift
//
//  Created by : Tomoaki Yagishita on 2022/11/05
//  © 2022  SmallDeskSoftware
//

import Foundation

extension Array {
    subscript(safe index: Array.Index) -> Array.Element? {
        return indices.contains(index) ? self[index] : nil
    }
    subscript(loop index: Array.Index) -> Array.Element? {
        if self.count == 0 { return nil }
        let adjustedIndex = index >= 0 ? index : (index + count * (abs(index) / count + 1))
        let newIndex = adjustedIndex % count
        return self[safe: newIndex]
    }
}
