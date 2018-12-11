//
//  UIWindowExtensionsTests.swift
//  SFExtension-iOSTests
//
//  Created by melon on 2018/12/11.
//  Copyright © 2018 cmapu. All rights reserved.
//

import XCTest
@testable import SFExtension

#if canImport(UIKit) && !os(watchOS)
import UIKit

final class UIWindowExtensionsTests: XCTestCase {
    
    func testSwitchRootViewController() {
        let viewController = UIViewController()
        let tableViewController = UITableViewController()
        
        let window = UIWindow()
        window.rootViewController = viewController
        
        XCTAssertNotNil(window.rootViewController)
        XCTAssertEqual(window.rootViewController!, viewController)
        
        window.switchRootViewController(to: tableViewController, animated: false)
        XCTAssertNotNil(window.rootViewController)
        XCTAssertEqual(window.rootViewController!, tableViewController)
        
        let completionExpectation = expectation(description: "Completed")
        
        window.switchRootViewController(to: viewController, animated: true, duration: 0.75) {
            completionExpectation.fulfill()
            XCTAssertNotNil(window.rootViewController)
            XCTAssertEqual(window.rootViewController!, viewController)
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
}
#endif
