import XCTest

func XCTUnwrap<T>(_ optional: @autoclosure () throws -> T?, file: StaticString = #file, line: UInt = #line) throws -> T {
    do {
        guard let unwrapped = try optional() else {
          let error = "XCTUnwrap: expected non-nil value"
          XCTFail(error, file: file, line: line)
          throw error
        }
        return unwrapped
    } catch {
          XCTFail((error as NSError).debugDescription, file: file, line: line)
          throw error
    }
}
