//
//  JSONPrimitiveConvertible.swift
//  JSONFactorable
//
//  Created by Bartłomiej Świerad on 17/12/2019.
//  Copyright © 2019 Railwaymen. All rights reserved.
//

import Foundation

protocol JSONPrimitiveConvertible: JSONConvertible {}

extension JSONPrimitiveConvertible {
    public func flatJSONObject() throws -> Any {
        return self
    }
}

extension Int: JSONPrimitiveConvertible {}

extension Int8: JSONPrimitiveConvertible {}

extension Int16: JSONPrimitiveConvertible {}

extension Int32: JSONPrimitiveConvertible {}

extension Int64: JSONPrimitiveConvertible {}

extension UInt: JSONPrimitiveConvertible {}

extension UInt8: JSONPrimitiveConvertible {}

extension UInt16: JSONPrimitiveConvertible {}

extension UInt32: JSONPrimitiveConvertible {}

extension UInt64: JSONPrimitiveConvertible {}

extension Double: JSONPrimitiveConvertible {}

extension Float: JSONPrimitiveConvertible {}

extension String: JSONPrimitiveConvertible {}

extension Bool: JSONPrimitiveConvertible {}
