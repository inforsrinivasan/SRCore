import XCTest
@testable import SRCore

final class SRCoreTests: XCTestCase {

    func testColorRedEqual() {
        let color = SRCore.colorFromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }

    func testColorAreEqual() {
        let color = SRCore.colorFromHexString("006736")
        XCTAssertEqual(color, SRCore.srColor)
    }

    static var allTests = [
        ("testColorRedEqual", testColorRedEqual)
    ]
}
