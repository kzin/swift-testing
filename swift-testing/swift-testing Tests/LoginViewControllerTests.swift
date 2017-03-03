//
//  ViewControllerTests.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 03/03/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

import Foundation
import Nimble
import Quick
import Nimble_Snapshots

@testable import swift_testing

class ViewControllerTests: QuickSpec {
    
    var viewController: LoginViewController!
    
    func showViewController() {
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
    
    override func spec() {
        describe("LoginViewController") {
            
            var authenticationManager: AuthenticationManagerMock!
            
            beforeEach {
                authenticationManager = AuthenticationManagerMock()
                
                self.viewController = LoginViewController(authenticationManager: authenticationManager)
                self.showViewController()
            }
            
            it("should have a cool layout") {
                expect(self.viewController.view).toEventually(haveValidSnapshot())
            }
            
            it("should call login request on loginButton tap") {
                self.viewController.loginView.loginButton.sendActions(for: .touchUpInside)
                expect(authenticationManager.authenticateWasCalled).to(beTrue())
            }
        }
    }
}
