//
//  MyDelegateDatasourceTest.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 21/07/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Nimble_Snapshots

@testable import swift_testing

class MyDelegateDatasourceTest: QuickSpec {
    
    override func spec() {
        
        var myDelegateDatasource: MyDelegateDatasource!
        let myDelegate = MyDelegateDatasourceMock()
        var tableView: UITableView!
        
        describe("MyDelegateDatasource") {
            
            beforeEach {
                let data = ["Rodrigo", "Cavalcante", "Testing", "Delegate", "Datasource"]
                myDelegateDatasource = MyDelegateDatasource()
                
                myDelegateDatasource.data = data
                myDelegateDatasource.delegate = myDelegate
                
                tableView = UITableView()
                tableView.register(UITableViewCell.self,
                                   forCellReuseIdentifier: "Cell")
                tableView.dataSource = myDelegateDatasource
                tableView.delegate = myDelegateDatasource
            }
            
            //MARK: Datasource
            
            it("should return the right number of rows") {
                expect(myDelegateDatasource.tableView(tableView, numberOfRowsInSection: 0)) == 5
            }
            
            it("should return the right number of sections") {
                expect(myDelegateDatasource.numberOfSections(in: tableView)) == 1
            }
            
            it("should return Rodrigo view for indexPath.row = 0") {
                let indexPath = IndexPath(row: 0, section: 0)
                
                let cell = myDelegateDatasource.tableView(tableView, cellForRowAt: indexPath)
                cell.setDynamicFrame(forWidth: 320)
                
                expect(cell) == snapshot()
            }
            
            it("should return Cavalcante view for indexPath.row = 0") {
                let indexPath = IndexPath(row: 1, section: 0)
                
                let cell = myDelegateDatasource.tableView(tableView, cellForRowAt: indexPath)
                cell.setDynamicFrame(forWidth: 320)
                
                expect(cell) == snapshot()
            }
            
            it("should return Testing view for indexPath.row = 0") {
                let indexPath = IndexPath(row: 2, section: 0)
                
                let cell = myDelegateDatasource.tableView(tableView, cellForRowAt: indexPath)
                cell.setDynamicFrame(forWidth: 320)
                
                expect(cell) == snapshot()
            }
            
            it("should return Delegate view for indexPath.row = 0") {
                let indexPath = IndexPath(row: 3, section: 0)
                
                let cell = myDelegateDatasource.tableView(tableView, cellForRowAt: indexPath)
                cell.setDynamicFrame(forWidth: 320)
                
                expect(cell) == snapshot()
            }
            
            it("should return Datasoruce view for indexPath.row = 0") {
                let indexPath = IndexPath(row: 4, section: 0)
                
                let cell = myDelegateDatasource.tableView(tableView, cellForRowAt: indexPath)
                cell.setDynamicFrame(forWidth: 320)
                
                expect(cell) == snapshot()
            }
            
            //MARK: Delegate
            
            it("should return Rodrigo if user select first Cell") {
                let indexPath = IndexPath(row: 0, section: 0)
                
                expect(myDelegate.didSelectCell) == false
                
                myDelegateDatasource.tableView(tableView, didSelectRowAt: indexPath)
                expect(myDelegate.didSelectCell) == true
                expect(myDelegate.data!) == "Rodrigo"
            }
        }
    }
}
