//
//  AuthenticationService.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 03/03/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

import Foundation

protocol AuthenticationManager {
    func authenticate(username: String,
                      password: String,
                      completion:@escaping (Result<JsonObjectResponse<User>>) -> Void)
}

class RealAuthenticationManager: AuthenticationManager {
    func authenticate(username: String,
                      password: String,
                      completion:@escaping (Result<JsonObjectResponse<User>>) -> Void){
        if username == "username" && password == "password" {
            let json = Json(json: JSON.user())
            let response: JsonObjectResponse<User> = JsonObjectResponse<User>(json: json!)
            completion(.success(response))
        } else {
            completion(.error)
        }
    }
}
