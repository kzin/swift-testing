//
//  UserCellTests.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 15/03/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import swift_testing

extension UITableViewCell {
    func setDynamicFrame(forWidth width: Double) {
        let cellSize = self.systemLayoutSizeFitting(CGSize(width: width, height: 10000))
        self.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: CGFloat(width), height: cellSize.height))
    }
}

class UserCellTests: QuickSpec {
    
    override func spec() {
        
        describe("UserCell") {
            
            var cell: UserCell!
            
            beforeEach {
                let validJson = User.validJson()
                let user = User(json: validJson)!
                
                cell = UserCell(style: UITableViewCellStyle.default, reuseIdentifier: "UserCell")
                cell.setup(user: user)
                cell.setDynamicFrame(forWidth: 320)
            }
            
            it("should have cool layout when load a user") {
                expect(cell) == snapshot()
            }
            
            it("should selection style to be none") {
                expect(cell.selectionStyle) == UITableViewCellSelectionStyle.none
            }
        }
    }
}
