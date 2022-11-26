//
//  File.swift
//
//  Created by : Tomoaki Yagishita on 2022/11/26
//  © 2022  SmallDeskSoftware
//

import Foundation

@available(macOS 13, iOS 16, *)
extension Duration {
    public var timeInterval: TimeInterval {
        let (seconds, attoSeconds) = self.components
        return Double(seconds) + Double(attoSeconds) * 1.0e-18
    }

    public init(timeInterval: TimeInterval) {
        self = .seconds(timeInterval)
    }
}
