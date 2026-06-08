//
//  RangeSet_findGapTests.swift
//  SDSSwiftExtension
//
//  Created by Tomoaki Yagishita on 2026/06/08.
//

import Testing
@testable import SDSSwiftExtension

struct RangeSet_findGapTests {
    @available(macOS 15.0, iOS 18.0, *)
    @Test func findGap() async throws {
        let sut = RangeSet([1..<3, 4..<7, 10..<12])
        
        #expect(sut.findGapRange(includes: 1) == nil)
        #expect(sut.findGapRange(includes: 3) == 3..<4)
        #expect(sut.findGapRange(includes: 4) == nil)
        #expect(sut.findGapRange(includes: 7) == 7..<10)
        #expect(sut.findGapRange(includes: 10) == nil)
    }
}
