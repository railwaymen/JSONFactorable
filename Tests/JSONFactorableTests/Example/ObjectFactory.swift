import Foundation
import JSONFactorable

struct ObjectFactory: JSONFactorable {
    var decoder: JSONDecoder {
        return JSONDecoder()
    }

    func buildObject(
        id: Int64,
        name: String,
        subobject: Object.Subobject
    ) throws -> Object {
        let jsonConvertible: AnyJSONConvertible = [
            "id": AnyJSONConvertible(id),
            "name": AnyJSONConvertible(name),
            "subobject": AnyJSONConvertible(subobject)
        ]
        return try self.buildObject(of: jsonConvertible)
    }

    func buildSubobject(
        name: String,
        price: Double
    ) throws -> Object.Subobject {
        let jsonConvertible: AnyJSONConvertible = [
            "name": AnyJSONConvertible(name),
            "price": AnyJSONConvertible(price)
        ]
        return try self.buildObject(of: jsonConvertible)
    }
}
