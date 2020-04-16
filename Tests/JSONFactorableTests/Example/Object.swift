import Foundation

struct Object: Decodable {
    let id: Int64
    let name: String
    let subobject: Subobject

    struct Subobject: Decodable {
        let name: String
        let price: Double
    }
}
