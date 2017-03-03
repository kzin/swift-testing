//
//  AuthenticationManagerMock.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 03/03/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

@testable import swift_testing

class AuthenticationManagerMock : AuthenticationManager {
    
    var authenticateWasCalled = false
    var result: Result<JsonObject>?
    
    func authenticate(username: String, password: String, completion: @escaping (Result<JsonObject>) -> Void) {
        
        if let result = result {
            completion(result)
        }
        
        authenticateWasCalled = true
    }
}
