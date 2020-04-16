import Foundation

extension JSONSerialization {
    static func data(with jsonConvertible: JSONConvertible, options: JSONSerialization.WritingOptions) throws -> Data {
        let jsonObject = try jsonConvertible.flatJSONObject()
        guard jsonObject is [Any] || jsonObject is [String: Any] else { throw JSONConversionError.topLevelJSONObjectIsIncorrect }
        guard self.isValidJSONObject(jsonObject) else { throw JSONConversionError.incorrectJSONObject }
        return try self.data(withJSONObject: jsonObject, options: options)
    }
}
