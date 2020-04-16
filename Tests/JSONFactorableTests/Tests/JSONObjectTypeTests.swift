//
//  JSONObjectTypeTests.swift
//  JSONFactorable_Tests
//
//  Created by Bartłomiej Świerad on 18/12/2019.
//  Copyright © 2019 Railwaymen. All rights reserved.
//

import XCTest
@testable import JSONFactorable

class JSONObjectTypeTests: XCTestCase {}

// MARK: - flatJSONObject()
extension JSONObjectTypeTests {
    func testFlatJSONObject_withValue() throws {
        //Arrange
        let sut = JSONObjectMock(
            jsonConvertibleReturnValue: 1,
            jsonConvertibleThrowError: nil)
        //Act
        let result = try sut.flatJSONObject()
        //Assert
        XCTAssertEqual(result as? Int, 1)
    }
    
    func testFlatJSONObject_throwsError() throws {
        //Arrange
        let thrownError = TestError()
        let sut = JSONObjectMock(
            jsonConvertibleReturnValue: 1,
            jsonConvertibleThrowError: thrownError)
        //Act
        //Assert
        XCTAssertThrowsError(try sut.flatJSONObject()) { error in
            XCTAssertEqual(error as? TestError, thrownError)
        }
    }
}

// MARK: - Private structures
private struct JSONObjectMock<T: JSONConvertible>: JSONObjectType {
    let jsonConvertibleReturnValue: T
    let jsonConvertibleThrowError: Error?
    
    func jsonConvertible() throws -> JSONConvertible {
        if let error = self.jsonConvertibleThrowError {
            throw error
        }
        return self.jsonConvertibleReturnValue
    }
}
