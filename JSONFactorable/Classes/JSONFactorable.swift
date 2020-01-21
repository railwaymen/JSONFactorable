//
//  JSONFactorable.swift
//  JSONFactorable
//
//  Created by Bartłomiej Świerad on 17/12/2019.
//  Copyright © 2019 Railwaymen. All rights reserved.
//

import Foundation

public protocol JSONFactorable {
    ///
    /// Decoder using to build decodable structure by `buildObject(of:)` method
    ///
    var decoder: JSONDecoder { get }
}

extension JSONFactorable {
    ///
    /// Builds decodable object (`T`) of given AnyJSONConvertible.
    /// Given value should contain in first place an array or a dictionary, else error will be thrown.
    ///
    /// - Parameters:
    ///   - value: Raw JSON value to build decodable object of. The wrapper's value have to be an array or a dictionary.
    ///
    /// - Throws:
    ///   - Rethrows from `value.flatJSONObject()` call
    ///   - `JSONConversionError`
    ///     - `.topLevelJSONObjectIsIncorrect` if top level object is neither array or dictionary
    ///     - `.incorrectJSONObject` if given structure is incorrect.
    ///     It may occur if some value conforms to `JSONConvertible` protocol in the wrong way.
    ///     If you are not extending using `JSONConvertible` it is probably internal error
    ///   - Rethrows another errors of `JSONSerialization`
    ///   - Throws decoding error. This may indicate that given JSON is not parsable to the object.
    ///
    public func buildObject<T>(of value: AnyJSONConvertible) throws -> T where T: Decodable {
        let data = try JSONSerialization.data(with: value, options: .prettyPrinted)
        return try self.decoder.decode(T.self, from: data)
    }
}
