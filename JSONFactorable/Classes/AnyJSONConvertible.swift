//
//  AnyJSONConvertible.swift
//  JSONFactorable
//
//  Created by Bartłomiej Świerad on 17/12/2019.
//  Copyright © 2019 Railwaymen. All rights reserved.
//

import Foundation

public struct AnyJSONConvertible: JSONConvertible {
    private(set) public var base: Any
    
    public init<J>(_ base: J) where J: JSONConvertible {
        self.base = base
    }
    
    public func unwrappedValue() throws -> JSONConvertible {
        guard let base = self.base as? JSONConvertible else { throw JSONConversionError.baseIsNotJSONConvertible }
        guard let wrapper = self.base as? AnyJSONConvertible else { return base }
        return try wrapper.unwrappedValue()
    }
    
    public func flatJSONObject() throws -> Any {
        return try (self.base as? JSONConvertible)?.flatJSONObject() ?? self.base
    }
    
    public func merge(with otherJSON: AnyJSONConvertible) throws -> AnyJSONConvertible {
        let lhsUnwrapped = try self.unwrappedValue()
        let rhsUnwrapped = try otherJSON.unwrappedValue()
        if let lhsArray = lhsUnwrapped as? [AnyJSONConvertible], let rhsArray = rhsUnwrapped as? [AnyJSONConvertible] {
            return AnyJSONConvertible(lhsArray + rhsArray)
        } else if let lhsDict = lhsUnwrapped as? [String: AnyJSONConvertible], let rhsDict = rhsUnwrapped as? [String: AnyJSONConvertible] {
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
