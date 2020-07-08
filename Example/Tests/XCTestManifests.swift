#if !canImport(ObjectiveC)
import XCTest

extension ComputedPropertyTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ComputedPropertyTests = [
        ("testComputedInts", testComputedInts),
        ("testComputedPercentages", testComputedPercentages),
        ("testPerformanceExample", testPerformanceExample),
    ]
}

extension ConfigurationTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ConfigurationTests = [
        ("testInvalidConfigWithIntValue", testInvalidConfigWithIntValue),
        ("testInvalidConfigWithPercentageValue", testInvalidConfigWithPercentageValue),
        ("testPerformanceExample", testPerformanceExample),
        ("testValidConfigWithIntValue", testValidConfigWithIntValue),
        ("testValidConfigWithPercentageValue", testValidConfigWithPercentageValue),
    ]
}

extension ExtensionTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ExtensionTests = [
        ("testIntExtensions", testIntExtensions),
        ("testIntTypeConversions", testIntTypeConversions),
        ("testPercentageExtensions", testPercentageExtensions),
        ("testPercentageTypeConversions", testPercentageTypeConversions),
        ("testPerformanceExample", testPerformanceExample),
    ]
}

extension ObjectMethodTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ObjectMethodTests = [
        ("testIntMethods", testIntMethods),
        ("testPercentageMethods", testPercentageMethods),
        ("testPerformanceExample", testPerformanceExample),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ComputedPropertyTests.__allTests__ComputedPropertyTests),
        testCase(ConfigurationTests.__allTests__ConfigurationTests),
        testCase(ExtensionTests.__allTests__ExtensionTests),
        testCase(ObjectMethodTests.__allTests__ObjectMethodTests),
    ]
}
#endif