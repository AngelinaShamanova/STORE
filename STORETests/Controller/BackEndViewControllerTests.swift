//
//  BackEndViewControllerTests.swift
//  STORETests
//
//  Created by MacBook on 04.08.2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//


import XCTest
@testable import STORE

class BackEndViewControllerTests: XCTestCase {
    
    var sut: BackEndViewController!
    var cell: BackendCell!
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    override func setUp() {
        super.setUp()
        
        let vc = storyboard.instantiateViewController(identifier: String(describing: BackEndViewController.self))
        sut = vc as? BackEndViewController
        
        let tableView = sut.tableView
        
        cell = tableView?.dequeueReusableCell(withIdentifier: "BackendCell", for: IndexPath(row: 0, section: 0)) as? BackendCell
        
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        
        
        super.tearDown()
    }
    
    func testWhenViewIsLoadedCollectionViewIsNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedCollectionViewDelegateIsSet() {
        XCTAssertNotNil(sut.tableView.delegate)
    }
    
    func testWhenViewIsLoadedCollectionViewDataSourceIsSet() {
        XCTAssertNotNil(sut.tableView.dataSource)
    }
    
    func testCellHasNameLabel() {
        XCTAssertNotNil(cell.name)
        XCTAssertNotNil(cell.name.isDescendant(of: cell.contentView))
    }
    
    func testCellHasPriceLabel() {
        XCTAssertNotNil(cell.price)
        XCTAssertNotNil(cell.price.isDescendant(of: cell.contentView))
    }
    
    func testCellHasQuantityLabel() {
        XCTAssertNotNil(cell.quantity)
        XCTAssertNotNil(cell.quantity.isDescendant(of: cell.contentView))
    }

}

