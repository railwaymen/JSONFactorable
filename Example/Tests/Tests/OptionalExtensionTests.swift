//
//  OptionalExtensionTests.swift
//  JSONFactorable_Tests
//
//  Created by Bartłomiej Świerad on 18/12/2019.
//  Copyright © 2019 Railwaymen. All rights reserved.
//

import XCTest
@testable import JSONFactorable

class OptionalExtensionTests: XCTestCase {}

// MARK: - unwrap()
extension OptionalExtensionTests {
    func testUnwrap_notNilValue() throws {
        //Arrange
        let sut: Bool? = true
        //Act
        let result = try sut.unwrap()
        //Assert
        XCTAssertTrue(result)
    }
    
    func testUnwrap_nilValue() throws {
        //Arrange
        let sut: Bool? = nil
        //Act
        //Assert
        XCTAssertThrowsError(try sut.unwrap()) { error in
            XCTAssertEqual(error as? JSONConversionError, JSONConversionError.unexpectedNil)
        }
    }
}
