//
//  TestError.swift
//  JSONFactorable_Tests
//
//  Created by Bartłomiej Świerad on 18/12/2019.
//  Copyright © 2019 Railwaymen. All rights reserved.
//

import Foundation

class TestError: Error {}

extension TestError: Equatable {
    static func == (lhs: TestError, rhs: TestError) -> Bool {
        return lhs === rhs
    }
}
