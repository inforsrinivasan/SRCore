//
//  SRNetworkingTests.swift
//  SRCoreTests
//
//  Created by Srinivasan Rajendran on 2020-05-28.
//

import XCTest
@testable import SRCore

class NetworkSessionMock: NetworkSession {

    var data: Data?
    var error: Error?

    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        completionHandler(data,error)
    }
    
}

final class SRNetworkingTests: XCTestCase {

    func testLoadDataCall() {
        let manager = SRCore.Networking.Manager()
        let session = NetworkSessionMock()
        manager.session = session
        let expectation = XCTestExpectation(description: "Called for data")
        let data = Data([1,2,3])
        session.data = data
        let url = URL(fileURLWithPath: "path")
        manager.loadData(from: url) { result in
            expectation.fulfill()
            switch result {
            case .success(let returnedData):
                XCTAssertEqual(returnedData, data, "manager returned unexpected data")
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
