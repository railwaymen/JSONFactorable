import Foundation

///
/// Your custom objects should conform to this protocol if you want to make them convertible to JSON.
/// Simply implement `jsonConvertible()` returning JSON value for the object. The framework will take care of the rest
///
/// Do not implement `flatJSONObject()` function. It is already implemented.
///
public protocol JSONObjectType: JSONConvertible {
    ///
    /// Should return value that is `JSONConvertible` and is representation of the object.
    /// It shouldn't return self, because it will cause infinite loop in runtime.
    ///
    /// Thrown errors are rethrown in `flatJSONObject()` and can be handled when building an object in the factory class.
    ///
    func jsonConvertible() throws -> JSONConvertible
}

extension JSONObjectType {
    ///
    /// Do not implement this function. Implement `jsonConvertible()` instead.
    ///
    public func flatJSONObject() throws -> Any {
        return try self.jsonConvertible().flatJSONObject()
    }
}
