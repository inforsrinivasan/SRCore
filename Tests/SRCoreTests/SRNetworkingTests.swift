//
//  SRNetworkingTests.swift
//  SRCoreTests
//
//  Created by Srinivasan Rajendran on 2020-05-28.
//

import XCTest
@testable import SRCore

final class SRNetworkingTests: XCTestCase {

    func testLoadDataCall() {
        let manager = SRCore.Networking.Manager()
        let expectation = XCTestExpectation(description: "Called for data")
        guard let url = URL(string: "https://raywenderlich.com") else {
            return XCTFail("Could not create URL properly")
        }
        manager.loadData(from: url) { result in
            expectation.fulfill()
            switch result {
            case .success(let returnedData):
                XCTAssertNotNil(returnedData, "Response data is nil")
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "error in fetching response data")
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }

    static var allTests = [
        ("testLoadDataCall", testLoadDataCall)
    ]

}
