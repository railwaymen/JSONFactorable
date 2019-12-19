//
//  Optional+Unwrap.swift
//  JSONFactorable
//
//  Created by Bartłomiej Świerad on 17/12/2019.
//  Copyright © 2019 Railwaymen. All rights reserved.
//

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
