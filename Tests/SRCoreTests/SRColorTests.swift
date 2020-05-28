import XCTest
@testable import SRCore

final class SRColorTests: XCTestCase {

    func testColorRedEqual() {
        let color = SRCore.Color.fromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }

    func testSRColorAreEqual() {
        let color = SRCore.Color.fromHexString("006736")
        XCTAssertEqual(color, SRCore.Color.srColor)
    }

    func testSRSecondayColorAreEqual() {
        let color = SRCore.Color.fromHexString("003736")
        XCTAssertEqual(color, SRCore.Color.srSecondaryColor)
    }

    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
        ("testSRColorAreEqual", testSRColorAreEqual),
        ("testSRSecondayColorAreEqual", testSRSecondayColorAreEqual)
    ]
}
