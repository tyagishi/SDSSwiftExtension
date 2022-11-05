//
//  ArraySubscript_Tests.swift
//
//  Created by : Tomoaki Yagishita on 2022/11/05
//  © 2022  SmallDeskSoftware
//
@testable import SDSSwiftExtension
import XCTest

final class ArraySubscriptSafe_Tests: XCTestCase {
    func test_safeReturnElement() async throws {
        let sut = [0, 1, 2, 3, 4]

        let zero = try XCTUnwrap(sut[safe: 0])
        XCTAssertEqual(zero, 0)
        let two = try XCTUnwrap(sut[safe: 2])
        XCTAssertEqual(two, 2)
        let four = try XCTUnwrap(sut[safe: 4])
        XCTAssertEqual(four, 4)
    }

    func test_safeReturnNil() async throws {
        let sut = [0, 1, 2, 3, 4]

        let five = sut[safe: 5]
        XCTAssertNil(five)
    }
}
