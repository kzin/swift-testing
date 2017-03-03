//
//  UserTests.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 03/03/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

import Nimble
import Quick

@testable import swift_testing

extension User {
    static func validJson() -> JsonObject {
        
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

class UserTests: QuickSpec {
    
    override func spec() {
        describe("User") {
            var user: User!
            var validJson: JsonObject!
            
            beforeEach {
                validJson =  User.validJson()
            }
            
            it("should parse all properties") {
                user = User(json: validJson)
                
                expect(user.username) == "username"
                expect(user.email) == "user@mail.com"
                expect(user.age) == 26
            }
            
            it("should not parse for missing username") {
                validJson.removeValue(forKey: "username")
                user = User(json: validJson)
                
                expect(user).to(beNil())
            }
            
            it("should not parse for missing email") {
                validJson.removeValue(forKey: "email")
                user = User(json: validJson)
                
                expect(user).to(beNil())
            }
            
            it("should not parse for missing age") {
                validJson.removeValue(forKey: "age")
                user = User(json: validJson)
                
                expect(user).to(beNil())
            }
        }
    }
}
