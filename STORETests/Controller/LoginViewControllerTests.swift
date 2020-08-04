//
//  LoginViewControllerTests.swift
//  STORETests
//
//  Created by MacBook on 04.08.2020.
//  Copyright © 2020 mybestcompany.com. All rights reserved.
//

import XCTest
@testable import STORE

class LoginViewControllerTests: XCTestCase {

    var sut: LoginViewController!
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    override func setUp() {
        super.setUp()
        
        let vc = storyboard.instantiateViewController(identifier: String(describing: LoginViewController.self))
        sut = vc as? LoginViewController
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        
        super.tearDown()
    }

    func testViewHasUserTextField() {
        XCTAssertNotNil(sut.userNameTextField)
    }
    
    func testViewHasPasswordTextField() {
        XCTAssertNotNil(sut.passwordTextField)
    }
    
    func testViewHasLogInButton() {
        XCTAssertNotNil(sut.logInButton)
    }
}
