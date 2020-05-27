import XCTest
@testable import SRCore

final class SRCoreTests: XCTestCase {

    func testColorRedEqual() {
        let color = SRCore.colorFromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }

    static var allTests = [
        ("testColorRedEqual", testColorRedEqual)
    ]
}
