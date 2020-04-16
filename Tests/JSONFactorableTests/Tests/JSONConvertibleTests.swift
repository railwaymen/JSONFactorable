import XCTest
@testable import JSONFactorable

class JSONConvertibleTests: XCTestCase {}

// MARK: - flatJSONObject()
extension JSONConvertibleTests {
    func testFlatJSONObject_optionalSome() throws {
        //Arrange
        let sut: Int? = 1
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertEqual(result as? Int, 1)
    }

    func testFlatJSONObject_optionalNone() throws {
        //Arrange
        let sut: Int? = .none
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertTrue(result is NSNull)
    }

    func testFlatJSONObject_URL() throws {
        //Arrange
        let sut = try XCTUnwrap(URL(string: "example.com"))
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertEqual(result as? String, sut.absoluteString)
    }

    func testFlatJSONObject_array() throws {
        //Arrange
        let sut = [AnyJSONConvertible(1), AnyJSONConvertible(2)]
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertEqual(result as? [Int], [1, 2])
    }

    func testFlatJSONObject_set() throws {
        //Arrange
        let sut = Set([1, 2])
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        let array = try XCTUnwrap(result as? [Int])
        XCTAssertEqual(array.count, 2)
        XCTAssertTrue(array.contains(1))
        XCTAssertTrue(array.contains(2))
    }

    func testFlatJSONObject_dictionary() throws {
        //Arrange
        let sut = ["first": AnyJSONConvertible(1), "second": AnyJSONConvertible(2)]
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertEqual(result as? [String: Int], ["first": 1, "second": 2])
    }
}
