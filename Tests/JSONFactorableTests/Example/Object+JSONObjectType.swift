//
//  Object+JSONObjectType.swift
//  JSONFactorable_Tests
//
//  Created by Bartłomiej Świerad on 18/12/2019.
//  Copyright © 2019 Railwaymen. All rights reserved.
//

import Foundation
import JSONFactorable

extension Object.Subobject: JSONObjectType {
    func jsonConvertible() throws -> JSONConvertible {
        return AnyJSONConvertible([
            "name": AnyJSONConvertible(self.name),
            "price": AnyJSONConvertible(self.price)
        ])
    }
}
