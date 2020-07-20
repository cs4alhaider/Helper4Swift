import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Helper4SwiftTests.allTests),
    ]
}
#endif
