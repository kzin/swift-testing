//
//  LoginViewXibTests.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 06/03/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import swift_testing

class LoginViewXibTests: QuickSpec {
    
    override func spec() {

        describe("LoginViewXib"){

            var view: LoginViewXib!
            
            beforeEach {
                view = Bundle.main.loadNibNamed("LoginViewXib",
                                                owner: nil,
                                                options: nil)?.first as! LoginViewXib
            }
            
            it("should have a cool layout") {
                expect(view) == snapshot()
            }
        }
    }
}
