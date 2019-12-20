//
//  AnyJSONConvertibleTests.swift
//  JSONFactorable_Example
//
//  Created by Bartłomiej Świerad on 18/12/2019.
//  Copyright © 2019 Railwaymen. All rights reserved.
//

import XCTest
@testable import JSONFactorable

class AnyJSONConvertibleTests: XCTestCase {}

// MARK: - unwrappedValue()
extension AnyJSONConvertibleTests {
    func testUnwrappedValue_singleWrappedValue() throws {
        //Arrange
        let sut = AnyJSONConvertible(1)
        //Act
        let result = try sut.unwrappedValue()
        //Assert
        XCTAssertEqual(result as? Int, 1)
    }
    
    func testUnwrappedValue_doubleWrappedValue() throws {
        //Arrange
        let sut = AnyJSONConvertible(AnyJSONConvertible(1))
        //Act
        let result = try sut.unwrappedValue()
        //Assert
        XCTAssertEqual(result as? Int, 1)
    }
}

// MARK: - flatJSONObject()
extension AnyJSONConvertibleTests {
    func testFlatJSONObject_singleWrappedInt() throws {
        //Arrange
        let sut = AnyJSONConvertible(1)
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertEqual(result as? Int, 1)
    }
    
    func testFlatJSONObject_intWrappedInArray() throws {
        //Arrange
        let sut = AnyJSONConvertible([1])
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertEqual(result as? [Int], [1])
    }
    
    func testFlatJSONObject_intWrappedInDictionary() throws {
        //Arrange
        let sut = AnyJSONConvertible(["some": 1])
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        let resultDict = result as? [String: Any]
        XCTAssertEqual(resultDict?["some"] as? Int, 1)
    }
    
    func testFlatJSONObject_anyJSONConvertibleIntWrappedInDictionary() throws {
        //Arrange
        let sut = AnyJSONConvertible(["some": AnyJSONConvertible(1)])
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        let resultDict = result as? [String: Int]
        XCTAssertEqual(resultDict?["some"], 1)
    }
    
    func testFlatJSONObject_arrayWrappedInDictionary() throws {
        //Arrange
        let sut = AnyJSONConvertible(["some": [1]])
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        let resultDict = result as? [String: Any]
        XCTAssertEqual(resultDict?["some"] as? [Int], [1])
    }
}

// MARK: - merge(with:)
extension AnyJSONConvertibleTests {
    func testMerge_twoSimpleArrays() throws {
        //Arrange
        let sut1 = AnyJSONConvertible([AnyJSONConvertible(1)])
        let sut2 = AnyJSONConvertible([AnyJSONConvertible(2)])
        //Act
        let result = try sut1.merge(with: sut2)
        //Assert
        XCTAssertEqual(try result.flatJSONObject() as? [Int], [1, 2])
    }
    
    func testMerge_twoSimpleDictionaries() throws {
        //Arrange
        let sut1 = AnyJSONConvertible(["sut1": AnyJSONConvertible(1)])
        let sut2 = AnyJSONConvertible(["sut2": AnyJSONConvertible(2)])
        //Act
        let result = try sut1.merge(with: sut2)
        //Assert
        let resultDict = try result.flatJSONObject() as? [String: Int]
        XCTAssertEqual(resultDict?.keys.count, 2)
        XCTAssertEqual(resultDict?["sut1"], 1)
        XCTAssertEqual(resultDict?["sut2"], 2)
    }
    
    func testMerge_twoDictionariesWithIdenticalKeys() throws {
        //Arrange
        let sut1 = AnyJSONConvertible(["sut": AnyJSONConvertible(1)])
        let sut2 = AnyJSONConvertible(["sut": AnyJSONConvertible(2)])
        //Act
        let result = try sut1.merge(with: sut2)
        //Assert
        let resultDict = try result.flatJSONObject() as? [String: Int]
        XCTAssertEqual(resultDict?.keys.count, 1)
        XCTAssertEqual(resultDict?["sut"], 1)
    }
    
    func testMerge_simpleIntArrays() throws {
        //Arrange
        let sut1 = AnyJSONConvertible([1])
        let sut2 = AnyJSONConvertible([2])
        //Act
        //Assert
        XCTAssertThrowsError(try sut1.merge(with: sut2)) { error in
            XCTAssertEqual(error as? JSONConversionError, JSONConversionError.objectsNotMergable)
        }
    }
    
    func testMerge_simpleIntDicts() throws {
        //Arrange
        let sut1 = AnyJSONConvertible(["sut1": 1])
        let sut2 = AnyJSONConvertible(["sut2": 2])
        //Act
        //Assert
        XCTAssertThrowsError(try sut1.merge(with: sut2)) { error in
            XCTAssertEqual(error as? JSONConversionError, JSONConversionError.objectsNotMergable)
        }
    }
    
    func testMerge_arrayAndDictionary() throws {
        //Arrange
        let sut1 = AnyJSONConvertible(["sut1": AnyJSONConvertible(1)])
        let sut2 = AnyJSONConvertible([AnyJSONConvertible(2)])
        //Act
        //Assert
        XCTAssertThrowsError(try sut1.merge(with: sut2)) { error in
            XCTAssertEqual(error as? JSONConversionError, JSONConversionError.objectsNotMergable)
        }
    }
    
    func testMerge_twoInts() throws {
        //Arrange
        let sut1 = AnyJSONConvertible(1)
        let sut2 = AnyJSONConvertible(2)
        //Act
        //Assert
        XCTAssertThrowsError(try sut1.merge(with: sut2)) { error in
            XCTAssertEqual(error as? JSONConversionError, JSONConversionError.objectsNotMergable)
        }
    }
    
    func testMerge_arrayAndInt() throws {
        //Arrange
        let sut1 = AnyJSONConvertible(1)
        let sut2 = AnyJSONConvertible([AnyJSONConvertible(2)])
        //Act
        //Assert
        XCTAssertThrowsError(try sut1.merge(with: sut2)) { error in
            XCTAssertEqual(error as? JSONConversionError, JSONConversionError.objectsNotMergable)
        }
    }
}
