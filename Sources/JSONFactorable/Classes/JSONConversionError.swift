//
//  JSONConversionError.swift
//  JSONFactorable
//
//  Created by Bartłomiej Świerad on 17/12/2019.
//  Copyright © 2019 Railwaymen. All rights reserved.
//

import Foundation

public enum JSONConversionError: Error {
    case baseIsNotJSONConvertible
    case objectsNotMergable
    case unexpectedNil
    
    case incorrectJSONObject
    case topLevelJSONObjectIsIncorrect
}
