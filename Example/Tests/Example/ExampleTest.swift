//
//  ExampleTest.swift
//  JSONFactorable_Tests
//
//  Created by Bartłomiej Świerad on 18/12/2019.
//  Copyright © 2019 Railwaymen. All rights reserved.
//

import XCTest

class ExampleTest: XCTestCase {
    let objectFactory = ObjectFactory()
    
    func testBuildObject() throws {
        //Arrange
        let subobject = try self.objectFactory.buildSubobject(name: "Subobject", price: 1.23)
        //Act
        let sut = try self.objectFactory.buildObject(id: 1, name: "Object", subobject: subobject)
        //Assert
        XCTAssertEqual(sut.id, 1)
    }
}
