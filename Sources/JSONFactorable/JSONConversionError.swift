import Foundation

public enum JSONConversionError: Error {
    case baseIsNotJSONConvertible
    case objectsNotMergable
    case unexpectedNil

    case incorrectJSONObject
    case topLevelJSONObjectIsIncorrect
}
