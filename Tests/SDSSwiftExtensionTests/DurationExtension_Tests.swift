//
//  DurationExtension_Tests.swift
//
//  Created by : Tomoaki Yagishita on 2022/11/26
//  © 2022  SmallDeskSoftware
//

import XCTest
import Foundation

@available(macOS 13, iOS 16, *)
final class DurationExtension_Tests: XCTestCase {
    func test_study() async throws {
        let dotOne = Duration.seconds(1)
        if true {
            let (seconds, attoSeconds) = dotOne.components
            print(seconds)
            print(attoSeconds)
        }

        let nano = Duration.nanoseconds(1)
        if true {
            let (seconds, attoSeconds) = nano.components
            print(seconds)
            print(attoSeconds)
        }
    }
}
