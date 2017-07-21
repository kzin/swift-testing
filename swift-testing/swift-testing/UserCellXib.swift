//
//  UserCellXib.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 21/03/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

import UIKit

class UserCellXib: UITableViewCell {
    
    @IBOutlet weak var username: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = self.bounds
    }
}
