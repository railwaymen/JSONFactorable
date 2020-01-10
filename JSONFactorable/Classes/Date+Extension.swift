//
//  Date+Extension.swift
//  JSONFactorable
//
//  Created by Bartłomiej Świerad on 17/12/2019.
//  Copyright © 2019 Railwaymen. All rights reserved.
//

import Foundation

extension Date {
    ///
    /// Converts date to string basing on given coding strategy.
    ///
    /// It encodes the date and decodes it as `String`. It is pretty helpful in encoding date using `JSONFactorable`.
    ///
    /// - Parameters:
    ///   - codingStrategy: Way of encoding and decoding date by `JSONEncoder` and `JSONDecoder`
    ///
    public func toString(codingStrategy: Date.DateCodingStrategy) throws -> String {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = codingStrategy.encodingStrategy
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = codingStrategy.decodingStrategy
        let data = try encoder.encode([self])
        return try decoder.decode([String].self, from: data).first.unwrap()
    }
    
    public enum DateCodingStrategy {
        /// Defer to `Date` for choosing an encoding. This is the default strategy.
        case deferredToDate
        
        /// Encode the `Date` as a UNIX timestamp (as a JSON number).
        case secondsSince1970
        
        /// Encode the `Date` as UNIX millisecond timestamp (as a JSON number).
        case millisecondsSince1970
        
        /// Encode the `Date` as an ISO-8601-formatted string (in RFC 3339 format).
        @available(OSX 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
        case iso8601
        
        /// Encode the `Date` as a string formatted by the given formatter.
        case formatted(DateFormatter)
        
        var encodingStrategy: JSONEncoder.DateEncodingStrategy {
            switch self {
            case .deferredToDate:
                return .deferredToDate
            case .secondsSince1970:
                return .secondsSince1970
            case .millisecondsSince1970:
                return .millisecondsSince1970
            case .iso8601:
                return .iso8601
            case let .formatted(dateFormatter):
                return .formatted(dateFormatter)
            }
        }
        
        var decodingStrategy: JSONDecoder.DateDecodingStrategy {
            switch self {
            case .deferredToDate:
                return .deferredToDate
            case .secondsSince1970:
                return .secondsSince1970
            case .millisecondsSince1970:
                return .millisecondsSince1970
            case .iso8601:
                return .iso8601
            case let .formatted(dateFormatter):
                return .formatted(dateFormatter)
            }
        }
    }
}
