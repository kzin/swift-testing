//
//  MyTableViewController.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 21/07/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

import UIKit
import Cartography

class MyTableViewController: UIViewController, MyDelegateDatasourceProtocol {
    
    let tableView: UITableView
    let myDelegateDatasource: MyDelegateDatasource
    
    init() {
        self.tableView = UITableView.init()
        self.myDelegateDatasource = MyDelegateDatasource()
        super.init(nibName: nil, bundle: nil)
        self.myDelegateDatasource.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        build()
        requestExample()
    }
    
    func build() {
        buildViewHierarchy()
        buildConstrains()
        setup()
    }
    
    func buildViewHierarchy() {
        self.view.addSubview(tableView)
    }
    
    func buildConstrains() {
        
        constrain(self.view, tableView) { view, tableView in
            tableView.top == view.top + 20
            tableView.right == view.right
            tableView.bottom == view.bottom
            tableView.left == view.left
        }
    }

    func setup() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.dataSource = self.myDelegateDatasource
        self.tableView.delegate = self.myDelegateDatasource
        self.view.backgroundColor = .white
    }
    
    func requestExample() {
        self.myDelegateDatasource.data = ["Rodrigo", "Cavalcante", "Testing", "Delegate", "Datasource"]
        self.tableView.reloadData()
    }
    
    func didSelectCell(data: String) {
        print("Selected \(data)")
    }
}
