import Foundation

///
/// The protocol is mostly for internal use, but it cannot be marked as internal.
/// You shouldn't apply it to your own structures unless you know what you're doing.
/// Use `JSONObjectType` instead in this case.
///
public protocol JSONConvertible {
    ///
    /// Returns object acceptable by `JSONSerialization` when parsing to data.
    ///
    func flatJSONObject() throws -> Any
}

extension Optional: JSONConvertible where Wrapped: JSONConvertible {
    public func flatJSONObject() throws -> Any {
        switch self {
        case let .some(value): return try value.flatJSONObject()
        case .none: return NSNull()
        }
    }
}

extension URL: JSONConvertible {
    public func flatJSONObject() throws -> Any {
        return self.absoluteString
    }
}

extension Array: JSONConvertible where Element: JSONConvertible {
    public func flatJSONObject() throws -> Any {
        return try self.map { try $0.flatJSONObject() }
    }
}

extension Set: JSONConvertible where Element: JSONConvertible {
    public func flatJSONObject() throws -> Any {
        return try self.map { try $0.flatJSONObject() }
    }
}

extension Dictionary: JSONConvertible where Key == String, Value: JSONConvertible {
    public func flatJSONObject() throws -> Any {
        return try self.mapValues { try $0.flatJSONObject() }
    }
}
