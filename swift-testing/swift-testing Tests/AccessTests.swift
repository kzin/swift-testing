//
//  AccessTests.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 03/03/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

import Nimble
import Quick

@testable import swift_testing

extension Access {
    static func validJson() -> JsonObject {
        return [
            "profile": true,
            "timeline": true,
            "friends": true,
            "dashboard": true
        ]
    }
}

class AccessTests: QuickSpec {
    
    override func spec() {
        describe("Access") {
            var access: Access!
            var validJson: JsonObject!
            
            beforeEach {
                validJson =  Access.validJson()
            }
            
            it("should parse all properties") {
                access = Access(json: validJson)
                
                expect(access.profile) == true
                expect(access.timeline) == true
                expect(access.friends) == true
                expect(access.dashboard) == true
            }
            
            it("should parse false for missing profile") {
                validJson.removeValue(forKey: "profile")
                access = Access(json: validJson)
                
                expect(access.profile) == false
                expect(access.timeline) == true
                expect(access.friends) == true
                expect(access.dashboard) == true
            }
            
            it("should parse false for missing timeline") {
                validJson.removeValue(forKey: "timeline")
                access = Access(json: validJson)
                
                expect(access.profile) == true
                expect(access.timeline) == false
                expect(access.friends) == true
                expect(access.dashboard) == true
            }
            
            it("should parse false for missing friends") {
                validJson.removeValue(forKey: "friends")
                access = Access(json: validJson)
                
                expect(access.profile) == true
                expect(access.timeline) == true
                expect(access.friends) == false
                expect(access.dashboard) == true
            }
            
            it("should parse false for missing dashboard") {
                validJson.removeValue(forKey: "dashboard")
                access = Access(json: validJson)
                
                expect(access.profile) == true
                expect(access.timeline) == true
                expect(access.friends) == true
                expect(access.dashboard) == false
            }
        }
    }
}
