//
//  UIViewTexts.swift
//  SFExtension-iOSTests
//
//  Created by cy on 2018/10/13.
//  Copyright © 2018 cmapu. All rights reserved.
//

import XCTest
@testable import SFExtension

#if canImport(UIKit)
import UIKit
final class UIViewExtensionsTests: XCTestCase {
    
    func testHeight() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: frame)
        XCTAssertEqual(view.height, 100)
        view.height = 150
        XCTAssertEqual(view.frame.size.height, 150)
    }
    
    func testWidth() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: frame)
        XCTAssertEqual(view.width, 100)
        view.width = 150
        XCTAssertEqual(view.frame.size.width, 150)
    }
    
    func testX() {
        let frame = CGRect(x: 20, y: 20, width: 100, height: 100)
        let view = UIView(frame: frame)
        XCTAssertEqual(view.x, 20)
        view.x = 10
        XCTAssertEqual(view.frame.origin.x, 10)
    }
    
    func testY() {
        let frame = CGRect(x: 20, y: 20, width: 100, height: 100)
        let view = UIView(frame: frame)
        XCTAssertEqual(view.y, 20)
        view.y = 10
        XCTAssertEqual(view.frame.origin.y, 10)
    }
    
    func testTop() {
        let frame = CGRect(x: 20, y: 50, width: 100, height: 100)
        let view = UIView(frame: frame)
        XCTAssertEqual(view.top, 50)
        view.top = 20
        XCTAssertEqual(view.frame.minY, 20)
    }
    
    func testBottom() {
        let frame = CGRect(x: 20, y: 50, width: 100, height: 100)
        let view = UIView(frame: frame)
        XCTAssertEqual(view.bottom, 150)
        view.bottom = 200
        XCTAssertEqual(view.frame.maxY, 200)
    }
    
    func testLeft() {
        let frame = CGRect(x: 20, y: 50, width: 100, height: 100)
        let view = UIView(frame: frame)
        XCTAssertEqual(view.left, 20)
        view.left = 200
        XCTAssertEqual(view.frame.minX, 200)
    }
    
    func testRight() {
        let frame = CGRect(x: 20, y: 50, width: 100, height: 100)
        let view = UIView(frame: frame)
        XCTAssertEqual(view.right, 120)
        view.right = 200
        XCTAssertEqual(view.frame.maxX, 200)
    }
}
#endif
