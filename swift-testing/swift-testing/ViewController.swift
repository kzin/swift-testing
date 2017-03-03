//
//  ViewController.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 03/03/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

import UIKit
import Cartography

class ViewController: UIViewController {
    
    let loginView = LoginView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        build()
    }

    func build() {
        buildViewHierarchy()
        buildConstrains()
        setup()
    }
    
    func buildViewHierarchy() {
        self.view.addSubview(loginView)
    }
    
    func buildConstrains() {
        let verticalMargin: CGFloat = 16.0
        let horizontalMargin: CGFloat = 8.0
        
        constrain(self.view, loginView) { view, loginView in
            loginView.top == view.top + verticalMargin
            loginView.left == view.left + horizontalMargin
            loginView.right == view.right - horizontalMargin
        }
    }
    
    func setup() {
        self.view.backgroundColor = .white
        
        loginView.tapLoginButton = { username, password in
            
        }
    }
}

