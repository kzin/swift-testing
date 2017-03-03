//
//  UITextField+Extension.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 03/03/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

import UIKit

extension UITextField {
    func setTextAndSendEvent(_ text: String) {
        self.text = text
        self.sendActions(for: .editingChanged)
    }
}
