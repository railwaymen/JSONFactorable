import Foundation

extension Optional {
    func unwrap(file: StaticString = #file, line: UInt = #line) throws -> Wrapped {
        switch self {
        case .some(let wrappedValue):
            return wrappedValue
        case .none:
            throw JSONConversionError.unexpectedNil
        }
    }
}
