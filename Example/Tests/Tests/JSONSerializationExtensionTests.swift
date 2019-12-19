//
//  JSONSerializationExtensionTests.swift
//  JSONFactorable_Example
//
//  Created by Bartłomiej Świerad on 18/12/2019.
//  Copyright © 2019 Railwaymen. All rights reserved.
//

import XCTest
@testable import JSONFactorable

class JSONSerializationExtensionTests: XCTestCase {
    typealias SUT = JSONSerialization
}

// MARK: - data(with:options:)
extension JSONSerializationExtensionTests {
    func testDataWithJSONConvertible_array() throws {
        //Arrange
        let array: AnyJSONConvertible = [AnyJSONConvertible(1)]
        //Act
        let data = try SUT.data(with: array, options: .prettyPrinted)
        //Assert
        let object = try JSONDecoder().decode([Int].self, from: data)
        XCTAssertEqual(object, [1])
    }
    
    func testDataWithJSONConvertible_dictionary() throws {
        //Arrange
        let dictionary: AnyJSONConvertible = ["some": AnyJSONConvertible(1)]
        //Act
        let data = try SUT.data(with: dictionary, options: .prettyPrinted)
        //Assert
        let object = try JSONDecoder().decode([String: Int].self, from: data)
        XCTAssertEqual(object, ["some": 1])
    }
    
    func testDataWithJSONConvertible_notTopLevelObject() throws {
        //Arrange
        let value: AnyJSONConvertible = 1
        //Act
        //Assert
        XCTAssertThrowsError(try SUT.data(with: value, options: .prettyPrinted)) { error in
            XCTAssertEqual(error as? JSONConversionError, JSONConversionError.topLevelJSONObjectIsIncorrect)
        }
    }
}
