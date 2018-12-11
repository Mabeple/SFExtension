//
//  UINavigationControllerExtensionsTests.swift
//  SFExtension-iOSTests
//
//  Created by melon on 2018/12/11.
//  Copyright © 2018 cmapu. All rights reserved.
//

import XCTest
@testable import SFExtension

#if canImport(UIKit)
import UIKit

final class UINavigationControllerExtensionsTests: XCTestCase {
    
    func testPushViewController() {
        let navigationController = UINavigationController()
        let vcToPush = UIViewController()
        
        navigationController.pushViewController(vcToPush, animated: false)
        
        let exp = expectation(description: "pushCallback")
        
        navigationController.pushViewController(vcToPush) {
            XCTAssert(navigationController.viewControllers.count == 1)
            XCTAssertEqual(navigationController.topViewController, vcToPush)
            exp.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testPopViewController() {
        let rootVC = UIViewController()
        let navigationController = UINavigationController(rootViewController: rootVC)
        let vcToPush = UIViewController()
        navigationController.pushViewController(vcToPush, animated: false)
        XCTAssert(navigationController.viewControllers.count == 2)
        
        let exp = expectation(description: "pushCallback")
        navigationController.popViewController(animated: false) {
            XCTAssert(navigationController.viewControllers.count == 1)
            XCTAssertEqual(navigationController.topViewController, rootVC)
            exp.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testMakeTransparent() {
        let navigationController = UINavigationController(rootViewController: UIViewController())
        navigationController.makeTransparent(withTint: .red)
        let navBar = navigationController.navigationBar
        XCTAssertNotNil(navBar.shadowImage)
        XCTAssert(navBar.isTranslucent)
        XCTAssertEqual(navBar.tintColor, UIColor.red)
        
        let attrs = navBar.titleTextAttributes
        XCTAssertNotNil(attrs)
        let color = attrs![.foregroundColor] as? UIColor
        XCTAssertNotNil(color)
        XCTAssertEqual(color!, .red)
    }
    
}
#endif
