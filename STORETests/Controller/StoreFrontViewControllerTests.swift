//
//  StoreFrontViewControllerTests.swift
//  STORETests
//
//  Created by MacBook on 04.08.2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import XCTest
@testable import STORE

class StoreFrontViewControllerTests: XCTestCase {
    
    var sut: StoreFrontViewController!
    var cell: StorefrontCell!
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    override func setUp() {
        super.setUp()
        
        let vc = storyboard.instantiateViewController(identifier: String(describing: StoreFrontViewController.self))
        sut = vc as? StoreFrontViewController
        
        let collectionView = sut.collectionView
        
        cell = collectionView?.dequeueReusableCell(withReuseIdentifier: "StorefrontCell", for: IndexPath(item: 0, section: 0)) as? StorefrontCell
    
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        
        
        super.tearDown()
    }
    
    func testWhenViewIsLoadedCollectionViewIsNotNil() {
        XCTAssertNotNil(sut.collectionView)
    }
    
    func testWhenViewIsLoadedCollectionViewDelegateIsSet() {
        XCTAssertNotNil(sut.collectionView.delegate)
    }
    
    func testWhenViewIsLoadedCollectionViewDataSourceIsSet() {
        XCTAssertNotNil(sut.collectionView.dataSource)
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
    
    func testCellHasBuyButton() {
        XCTAssertNotNil(cell.buy)
        XCTAssertNotNil(cell.buy.isDescendant(of: cell.contentView))
    }

}

