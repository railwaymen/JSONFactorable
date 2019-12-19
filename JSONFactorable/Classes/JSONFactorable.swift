//
//  JSONFactorable.swift
//  JSONFactorable
//
//  Created by Bartłomiej Świerad on 17/12/2019.
//  Copyright © 2019 Railwaymen. All rights reserved.
//

import Foundation

public protocol JSONFactorable {
    var decoder: JSONDecoder { get }
}

extension JSONFactorable {
    public func buildObject<T>(of value: AnyJSONConvertible) throws -> T where T: Decodable {
        let data = try JSONSerialization.data(with: value, options: .prettyPrinted)
        return try self.decoder.decode(T.self, from: data)
    }
}
