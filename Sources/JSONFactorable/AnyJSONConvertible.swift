import Foundation

public struct AnyJSONConvertible: JSONConvertible {
    private(set) public var base: Any

    ///
    /// Default initializer
    ///
    /// - Parameters:
    ///   - base: A JSONConvertible value which should be contained by this wrapper
    ///
    public init<J>(_ base: J) where J: JSONConvertible {
        self.base = base
    }

    ///
    /// Unwraps base value to JSONConvertible which isn't AnyJSONConvertible.
    /// Should never throw an error.
    ///
    /// - Throws:
    ///   - `JSONConversionError.baseIsNotJSONConvertible` if base is not JSONConvertible.
    ///      This indicates internal framework issue.
    ///
    public func unwrappedValue() throws -> JSONConvertible {
        guard let base = self.base as? JSONConvertible else { throw JSONConversionError.baseIsNotJSONConvertible }
        if let jsonObject = self.base as? JSONObjectType {
            let jsonConvertible = try jsonObject.jsonConvertible()
            if let wrapper = jsonConvertible as? AnyJSONConvertible {
                return try wrapper.unwrappedValue()
            }
            return jsonConvertible
        } else if let wrapper = self.base as? AnyJSONConvertible {
            return try wrapper.unwrappedValue()
        }
        return base
    }

    ///
    /// Used internally to get flat objects acceptable by the `JSONSerialization` and to parse it to data.
    ///
    /// ```
    /// try AnyJSONConvertible("Some String").flatJSONObject() as? String == "Some String"
    /// try AnyJSONConvertible(123).flatJSONObject() as? Int == 123
    /// ```
    /// - Throws:
    ///   Rethrows error from base's `flatJSONObject` method
    ///
    public func flatJSONObject() throws -> Any {
        return try (self.base as? JSONConvertible)?.flatJSONObject() ?? self.base
    }

    ///
    /// Merges `self` with another `AnyJSONConvertible` and returns it
    ///
    /// - Parameters:
    ///   - otherJSON: second wrapper to merge with
    ///
    /// - Throws:
    ///   - `JSONConversionError.objectsNotMergable` if bases of both wrappers aren't arrays or dictionaries
    ///   - Rethrows errors from `unwrappedValue` function for both wrappers
    ///
    public func merge(with otherJSON: AnyJSONConvertible) throws -> AnyJSONConvertible {
        let lhsUnwrapped = try self.unwrappedValue()
        let rhsUnwrapped = try otherJSON.unwrappedValue()
        if let lhsArray = lhsUnwrapped as? [AnyJSONConvertible], let rhsArray = rhsUnwrapped as? [AnyJSONConvertible] {
            return AnyJSONConvertible(lhsArray + rhsArray)
        } else if let lhsDict = lhsUnwrapped as? [String: AnyJSONConvertible],
            let rhsDict = rhsUnwrapped as? [String: AnyJSONConvertible] {
            return AnyJSONConvertible(lhsDict.merging(rhsDict) { lhsValue, _ in lhsValue })
        }
        throw JSONConversionError.objectsNotMergable
    }
}

extension AnyJSONConvertible: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
}

extension AnyJSONConvertible: ExpressibleByExtendedGraphemeClusterLiteral {}

extension AnyJSONConvertible: ExpressibleByStringInterpolation {}

extension AnyJSONConvertible: ExpressibleByUnicodeScalarLiteral {}

extension AnyJSONConvertible: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: BooleanLiteralType) {
        self.init(value)
    }
}

extension AnyJSONConvertible: ExpressibleByNilLiteral {
    public init(nilLiteral: ()) {
        self.init(AnyJSONConvertible?.none)
    }
}

extension AnyJSONConvertible: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self.init(value)
    }
}

extension AnyJSONConvertible: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = AnyJSONConvertible

    public init(arrayLiteral elements: ArrayLiteralElement...) {
        self.init(Array(elements))
    }
}

extension AnyJSONConvertible: ExpressibleByDictionaryLiteral {
    public typealias Key = String
    public typealias Value = AnyJSONConvertible

    public init(dictionaryLiteral elements: (Key, Value)...) {
        self.init(Dictionary(uniqueKeysWithValues: elements))
    }
}

extension AnyJSONConvertible: ExpressibleByFloatLiteral {
    public init(floatLiteral value: FloatLiteralType) {
        self.init(value)
    }
}
