//
//  Issue4Tests.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 24/03/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import swift_testing

class Issue4Tests: QuickSpec {
    
    override func spec() {
        
        describe("UserCellXib") {
            
            var cell: UserCellXib!
            
            beforeEach {
                cell = Bundle.main.loadNibNamed("UserCellXib",
                                                owner: nil,
                                                options: nil)?.first as! UserCellXib
                cell.layoutIfNeeded()
            }
            
            it("should have cool layout") {
                cell.username.text = "Tests\nTests\nTests"
                cell.layoutIfNeeded()
                cell.setDynamicFrame(forWidth: 320.0)
                expect(cell) == snapshot()
            }
        }
    }
}
