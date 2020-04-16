import Foundation

class TestError: Error {}

extension TestError: Equatable {
    static func == (lhs: TestError, rhs: TestError) -> Bool {
        return lhs === rhs
    }
}
