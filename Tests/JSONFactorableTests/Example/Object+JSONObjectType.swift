import JSONFactorable

extension Object.Subobject: JSONObjectType {
    func jsonConvertible() throws -> JSONConvertible {
        return AnyJSONConvertible([
            "name": AnyJSONConvertible(self.name),
            "price": AnyJSONConvertible(self.price)
        ])
    }
}
