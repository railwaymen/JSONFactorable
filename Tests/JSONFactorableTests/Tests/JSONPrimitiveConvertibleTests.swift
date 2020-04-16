import XCTest
@testable import JSONFactorable

class JSONPrimitiveConvertibleTests: XCTestCase {}

// MARK: - flatJSONObject()
extension JSONPrimitiveConvertibleTests {
    func testFlatJSONObject_int() throws {
        //Arrange
        let sut: Int = 1
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertTrue(result is Int)
        XCTAssertEqual(result as? Int, sut)
    }

    func testFlatJSONObject_int8() throws {
        //Arrange
        let sut: Int8 = 1
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertTrue(result is Int8)
        XCTAssertEqual(result as? Int8, sut)
    }

    func testFlatJSONObject_int16() throws {
        //Arrange
        let sut: Int16 = 1
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertTrue(result is Int16)
        XCTAssertEqual(result as? Int16, sut)
    }

    func testFlatJSONObject_int32() throws {
        //Arrange
        let sut: Int32 = 1
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertTrue(result is Int32)
        XCTAssertEqual(result as? Int32, sut)
    }

    func testFlatJSONObject_int64() throws {
        //Arrange
        let sut: Int64 = 1
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertTrue(result is Int64)
        XCTAssertEqual(result as? Int64, sut)
    }

    func testFlatJSONObject_uint() throws {
        //Arrange
        let sut: UInt = 1
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertTrue(result is UInt)
        XCTAssertEqual(result as? UInt, sut)
    }

    func testFlatJSONObject_uint8() throws {
        //Arrange
        let sut: UInt8 = 1
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertTrue(result is UInt8)
        XCTAssertEqual(result as? UInt8, sut)
    }

    func testFlatJSONObject_uint16() throws {
        //Arrange
        let sut: UInt16 = 1
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertTrue(result is UInt16)
        XCTAssertEqual(result as? UInt16, sut)
    }

    func testFlatJSONObject_uint32() throws {
        //Arrange
        let sut: UInt32 = 1
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertTrue(result is UInt32)
        XCTAssertEqual(result as? UInt32, sut)
    }

    func testFlatJSONObject_uint64() throws {
        //Arrange
        let sut: UInt64 = 1
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertTrue(result is UInt64)
        XCTAssertEqual(result as? UInt64, sut)
    }

    func testFlatJSONObject_double() throws {
        //Arrange
        let sut: Double = 1.23
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertTrue(result is Double)
        XCTAssertEqual(result as? Double, sut)
    }

    func testFlatJSONObject_float() throws {
        //Arrange
        let sut: Float = 1.23
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertTrue(result is Float)
        XCTAssertEqual(result as? Float, sut)
    }

    func testFlatJSONObject_string() throws {
        //Arrange
        let sut: String = "some"
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertTrue(result is String)
        XCTAssertEqual(result as? String, sut)
    }

    func testFlatJSONObject_bool() throws {
        //Arrange
        let sut: Bool = true
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertTrue(result is Bool)
        XCTAssertTrue(try XCTUnwrap(result as? Bool))
    }
}
