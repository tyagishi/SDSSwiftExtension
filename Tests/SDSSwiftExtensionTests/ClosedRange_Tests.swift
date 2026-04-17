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
    
    func test_ClosedRange_ratioValueStride() async throws {
        let sut = (1.1)...(3.7)
        
        XCTAssertEqual(sut.ratio(for: 1.1), 0.0, accuracy: 0.01)
        XCTAssertEqual(sut.ratio(for: 3.7), 1.0, accuracy: 0.01)
        XCTAssertEqual(sut.ratio(for: 2.4), 0.5, accuracy: 0.01)

        XCTAssertEqual(sut.value(from: 0.0), 1.1, accuracy: 0.01)
        XCTAssertEqual(sut.value(from: 1.0), 3.7, accuracy: 0.01)
        XCTAssertEqual(sut.value(from: 0.5), 2.4, accuracy: 0.01)
    }
}
