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
import KIF
import KIF_Quick

@testable import swift_testing

class ViewControllerTests: KIFSpec {
    
    var viewController: ViewController!
    
    func showViewController() {
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
    
    func usernameTextField() -> KIFUIViewTestActor {
        return viewTester().usingLabel("Username")
    }
    
    override func spec() {
        describe("ViewController") {
            
            beforeEach {
                self.viewController = ViewController()
                self.showViewController()
            }
            
            it("should have a cool layout") {
                expect(self.viewController.view).toEventually(haveValidSnapshot())
            }
        }
    }
}
