@testable import SDSSwiftExtension
import XCTest

final class PairIterator_Tests: XCTestCase {

    func test_pairIterator_loopArray_4elements() async throws {
        let array = [1,2,3,4]
        var iterator = PairIterator(array)

        let (c1,n1) = try XCTUnwrap(iterator.next())
        XCTAssertEqual(c1, 1)
        XCTAssertEqual(n1, 2)

        let (c2,n2) = try XCTUnwrap(iterator.next())
        XCTAssertEqual(c2, 2)
        XCTAssertEqual(n2, 3)

        let (c3,n3) = try XCTUnwrap(iterator.next())
        XCTAssertEqual(c3, 3)
        XCTAssertEqual(n3, 4)

        let (c4,n4) = try XCTUnwrap(iterator.next())
        XCTAssertEqual(c4, 4)
        XCTAssertEqual(n4, nil)

        XCTAssertNil(iterator.next())
    }

    func test_pairIterator_loopArray_1elements() async throws {
        let array: [Int] = [3]
        var iterator = PairIterator(array)
        let (c1,n1) = try XCTUnwrap(iterator.next())
        XCTAssertEqual(c1, 3)
        XCTAssertEqual(n1, nil)

        XCTAssertNil(iterator.next())
    }

    func test_pairIterator_loopArray_0elements() async throws {
        let array: [Int] = []
        var iterator = PairIterator(array)
        XCTAssertNil(iterator.next())
    }

    func test_makePairIterator_Array() async throws {
        let array = [1,2,3,4]
        var iterator = array.makePairIterator()
        let (c1,n1) = try XCTUnwrap(iterator.next())
        XCTAssertEqual(c1, 1)
        XCTAssertEqual(n1, 2)

        let (c2,n2) = try XCTUnwrap(iterator.next())
        XCTAssertEqual(c2, 2)
        XCTAssertEqual(n2, 3)

        let (c3,n3) = try XCTUnwrap(iterator.next())
        XCTAssertEqual(c3, 3)
        XCTAssertEqual(n3, 4)

        let (c4,n4) = try XCTUnwrap(iterator.next())
        XCTAssertEqual(c4, 4)
        XCTAssertEqual(n4, nil)

        XCTAssertNil(iterator.next())
    }
    func test_makePairIterator_Set() async throws {
        let array: Set<Int> = [1,2,3,4]
        var iterator = array.makePairIterator()
        let (c1,n1) = try XCTUnwrap(iterator.next())
        XCTAssertNotNil(c1)
        XCTAssertNotNil(n1)

        let (c2,n2) = try XCTUnwrap(iterator.next())
        XCTAssertNotNil(c2)
        XCTAssertNotNil(n2)
        XCTAssertEqual(n1, c2)

        let (c3,n3) = try XCTUnwrap(iterator.next())
        XCTAssertNotNil(c3)
        XCTAssertNotNil(n3)
        XCTAssertEqual(n2, c3)

        let (c4,n4) = try XCTUnwrap(iterator.next())
        XCTAssertNotNil(c4)
        XCTAssertNil(n4)
        XCTAssertEqual(n3, c4)

        XCTAssertNil(iterator.next())
    }
}
