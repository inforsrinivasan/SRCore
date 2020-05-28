import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SRColorTests.allTests),
        testCase(SRNetworkingTests.allTests)
    ]
}
#endif
