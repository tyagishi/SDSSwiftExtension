//
//  ArraySubscriptLoop_Tests.swift
//
//  Created by : Tomoaki Yagishita on 2022/11/05
//  © 2022  SmallDeskSoftware
//
@testable import SDSSwiftExtension
import XCTest

final class ArraySubscriptLoop_Tests: XCTestCase {
    func test_loopReturnElementWithinOriginal() async throws {
        let sut = [0, 1, 2, 3, 4]

        let zero = try XCTUnwrap(sut[safe: 0])
        XCTAssertEqual(zero, 0)
        let two = try XCTUnwrap(sut[safe: 2])
        XCTAssertEqual(two, 2)
        let four = try XCTUnwrap(sut[safe: 4])
        XCTAssertEqual(four, 4)
    }

    func test_loopReturnNilOnlyForEmptyArray() async throws {
        let sut:[Int] = []

        let element = sut[loop:0]
        XCTAssertNil(element)
    }

    func test_loopReturnElementBeforeStart() async throws {
        let sut = [0, 1, 2, 3, 4]

        let four = try XCTUnwrap(sut[loop: -1])
        XCTAssertEqual(four, 4)
        let one = try XCTUnwrap(sut[loop: -4])
        XCTAssertEqual(one, 1)
    }
    func test_loopReturnElementBeyondEnd() async throws {
        let sut = [0, 1, 2, 3, 4]

        let zero = try XCTUnwrap(sut[loop: 5])
        XCTAssertEqual(zero, 0)
        let three = try XCTUnwrap(sut[loop: 8])
        XCTAssertEqual(three, 3)
    }
}
