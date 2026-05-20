//
//  Test.swift
//  SDSSwiftExtension
//
//  Created by Tomoaki Yagishita on 2026/05/20.
//

import Testing

struct RangeSetTests {
    @available(macOS 15.0, iOS 18.0, *)
    @Test func oneGap() async throws {
        let sut = RangeSet<Int>([1..<2, 3..<5])
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        
        #expect(sut.gapRangeSet == RangeSet(2..<3))
    }

    @available(macOS 15.0, iOS 18.0, *)
    @Test func twoGap() async throws {
        let sut = RangeSet<Int>([1..<2, 3..<5, 9..<12])
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        
        #expect(sut.gapRangeSet == RangeSet([2..<3, 5..<9]))
    }

    @available(macOS 15.0, iOS 18.0, *)
    @Test func noGap() async throws {
        let sut = RangeSet<Int>([1..<2, 2..<5, 9..<12])
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        
        #expect(sut.gapRangeSet == RangeSet([5..<9]))
    }

}
