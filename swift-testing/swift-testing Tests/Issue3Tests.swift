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

class Issue3Tests: QuickSpec {
    
    var superView: UIView!
    
    override func spec() {
        
        describe("LoginView") {
            
            var view: LoginView!
            
            beforeEach {
                self.superView = UIView()
                view = LoginView()
                view.translatesAutoresizingMaskIntoConstraints = false
                self.superView.addSubview(view)
                
                view.userNameTextField.isHidden = true
                view.passwordTextField.isHidden = true
                view.loginButton.isHidden = true
            }
            
            var fontSize: CGFloat = 10.0
            for _ in 0...20 {
                it("Font size test") {
                    view.textLabel.font = UIFont.init(name: "SF UI Display", size: fontSize)
                    view.layoutIfNeeded()
                    expect(view) == snapshot("View+\(Int(fontSize))")
                    
                    fontSize += 1.0
                }
            }
        }
    }
}
