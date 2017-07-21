//
//  MyDelegateDatasourceMock.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 21/07/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

import Foundation

@testable import swift_testing

class MyDelegateDatasourceMock: MyDelegateDatasourceProtocol {
    
    var didSelectCell: Bool = false
    var data: String?
    
    func didSelectCell(data: String) {
        didSelectCell = true
        self.data = data
    }
}
