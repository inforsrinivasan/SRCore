import XCTest
@testable import SRCore

final class SRCoreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SRCore().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
