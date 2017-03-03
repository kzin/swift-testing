//
//  JSON.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 03/03/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

import Foundation

struct JSON {
    
    static func user() -> JsonObject {
        return [
            "username": "username",
            "email": "user@mail.com",
            "age": 26,
            "access": [
                "profile": true,
                "timeline": true,
                "friends": true,
                "dashboard": true
            ]
        ]
    }
}
