//
//  Object.swift
//  JSONFactorable_Tests
//
//  Created by Bartłomiej Świerad on 18/12/2019.
//  Copyright © 2019 Railwaymen. All rights reserved.
//

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
