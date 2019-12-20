//
//  JSONConvertible.swift
//  JSONFactorable
//
//  Created by Bartłomiej Świerad on 17/12/2019.
//  Copyright © 2019 Railwaymen. All rights reserved.
//

import Foundation

public protocol JSONConvertible {
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
