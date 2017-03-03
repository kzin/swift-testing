//
//  UITextField+Extension.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 03/03/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

import UIKit

extension UITextField {
    func isEmpty() -> Bool {
        if let text = self.text, text.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).isEmpty {
            return true
        }
        
        return false
    }
}
