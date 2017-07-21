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

class Issue41Tests: QuickSpec {
    
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
        }
    }
}
