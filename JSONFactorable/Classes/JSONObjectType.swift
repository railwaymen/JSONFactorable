//
//  JSONObjectType.swift
//  JSONFactorable
//
//  Created by Bartłomiej Świerad on 17/12/2019.
//  Copyright © 2019 Railwaymen. All rights reserved.
//

import Foundation

public protocol JSONObjectType: JSONConvertible {
    func jsonConvertible() throws -> JSONConvertible
}

extension JSONObjectType {
    public func flatJSONObject() throws -> Any {
        return try self.jsonConvertible().flatJSONObject()
    }
}
