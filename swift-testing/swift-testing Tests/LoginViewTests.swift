//
//  LoginViewTests.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 03/03/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import swift_testing

class LoginViewTests: QuickSpec {
    
    override func spec() {
        
        describe("LoginView") {
     
            var view: LoginView!
            
            beforeEach {
                view = LoginView()
                view.translatesAutoresizingMaskIntoConstraints = false
            }
            
            it("should have a cool layout") {
                expect(view) == snapshot()
            }
            
            it("should hide loginButton if user set username only") {
                view.userNameTextField.setTextAndSendEvent("username")
                
                expect(view) == snapshot()
            }
            
            it("should hide loginButton if user set password only") {
                view.passwordTextField.setTextAndSendEvent("password")
                
                expect(view) == snapshot()
            }
            
            it("should show loginButton if user set username and password") {
                view.userNameTextField.setTextAndSendEvent("username")
                view.passwordTextField.setTextAndSendEvent("password")
                
                expect(view) == snapshot()
            }
            
            it("should call tapLoginButton block when user tap loginButton") {
                var loginTapWasCalled = false
                
                view.tapLoginButton = { _, _ in
                    loginTapWasCalled = true
                }
                
                view.loginButton.sendActions(for: .touchUpInside)
                
                expect(loginTapWasCalled) == true
            }
        }
    }
}
