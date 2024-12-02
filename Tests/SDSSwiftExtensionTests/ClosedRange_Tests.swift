//
//  ClosedRange_Tests.swift
//  SDSSwiftExtension
//
//  Created by Tomoaki Yagishita on 2024/12/02.
//

import XCTest
@testable import SDSSwiftExtension

final class ClosedRange_Tests: XCTestCase {

    func test_ClosedRange_extend() async throws {
        let sut = 1...4
        
        XCTAssertEqual(sut.extend(to: 1), 1...4)
        XCTAssertEqual(sut.extend(to: 2), 1...4)
        XCTAssertEqual(sut.extend(to: 4), 1...4)

        XCTAssertEqual(sut.extend(to: 0), 0...4)
        XCTAssertEqual(sut.extend(to: 8), 1...8)
    }

}
