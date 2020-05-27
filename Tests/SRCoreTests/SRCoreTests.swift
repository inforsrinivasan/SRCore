import XCTest
@testable import SRCore

final class SRCoreTests: XCTestCase {

    func testColorRedEqual() {
        let color = SRCore.colorFromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }

    func testSRColorAreEqual() {
        let color = SRCore.colorFromHexString("006736")
        XCTAssertEqual(color, SRCore.srColor)
    }

    func testSRSecondayColorAreEqual() {
        let color = SRCore.colorFromHexString("003736")
        XCTAssertEqual(color, SRCore.srSecondaryColor)
    }

    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
        ("testSRColorAreEqual", testSRColorAreEqual),
        ("testSRSecondayColorAreEqual", testSRSecondayColorAreEqual)
    ]
}
