//
//  JsonObjectResponse.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 17/03/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

import Foundation

enum JsonObjectResponse<T> where T : JsonObjectParseable {
    case success(_: T)
    case error()
    
    init(json: Json) {
        switch json {
            
        case .array(_):
            self = .error()
            
        case .object(let objectJson):
            if let object = T(json: objectJson) {
                self = .success(object)
            } else {
                self = .error()
            }
        }
    }
}
