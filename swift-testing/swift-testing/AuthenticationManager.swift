//
//  AuthenticationService.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 03/03/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error
}

protocol AuthenticationManager {
    func authenticate(username: String,
                      password: String,
                      completion:@escaping (Result<JsonObject>) -> Void)
}

class RealAuthenticationManager: AuthenticationManager {
    func authenticate(username: String,
                      password: String,
                      completion:@escaping (Result<JsonObject>) -> Void){
        if username == "username" && password == "password" {
            completion(.success(JSON.user()))
        } else {
            completion(.error)
        }
    }
}
