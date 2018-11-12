//
//  UIViewTexts.swift
//  SFExtension
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
    
    func testSize() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: frame)
        XCTAssertEqual(view.size, view.frame.size)
        
        view.size = CGSize(width: 50, height: 50)
        XCTAssertEqual(view.frame.size.width, 50)
        XCTAssertEqual(view.frame.size.height, 50)
    }
    
    func testCornerRadius() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: frame)
        XCTAssertEqual(view.layer.cornerRadius, 0)
        
        view.cornerRadius = 50
        XCTAssertEqual(view.cornerRadius, 50)
    }
    
    func testBorderWidth() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: frame)
        view.borderWidth = 0
        XCTAssertEqual(view.layer.borderWidth, 0)
        
        view.borderWidth = 5
        XCTAssertEqual(view.borderWidth, 5)
    }
    
    func testBorderColor() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: frame)
        view.borderColor = nil
        XCTAssertNil(view.borderColor)
        view.borderColor = UIColor.red
        XCTAssertNotNil(view.layer.borderColor)
        XCTAssertEqual(view.borderColor!, UIColor.red)
//        XCTAssertEqual(view.layer.borderColor!.uiColor, UIColor.red)
    }
    
    func testParentViewController() {
        let viewController = UIViewController()
        XCTAssertNotNil(viewController.view.parentViewController)
        XCTAssertEqual(viewController.view.parentViewController, viewController)
        
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: frame)
        XCTAssertNil(view.parentViewController)
    }
    
    func testScreenshot() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: frame)
        view.backgroundColor = .black
        let screenshot = view.screenshot
        XCTAssertNotNil(screenshot)
        
        let view2 = UIView()
        XCTAssertNil(view2.screenshot)
    }
    
    func testShadowColor() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: frame)
        view.layer.shadowColor = nil
        XCTAssertNil(view.shadowColor)
        view.shadowColor = UIColor.orange
        XCTAssertNotNil(view.layer.shadowColor!)
        XCTAssertEqual(view.shadowColor, UIColor.orange)
    }
    
    func testShadowOffset() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: frame)
        view.layer.shadowOffset = CGSize.zero
        XCTAssertEqual(view.shadowOffset, CGSize.zero)
        let size = CGSize(width: 5, height: 5)
        view.shadowOffset = size
        XCTAssertEqual(view.layer.shadowOffset, size)
    }
    
    func testShadowOpacity() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: frame)
        view.layer.shadowOpacity = 0
        XCTAssertEqual(view.shadowOpacity, 0)
        view.shadowOpacity = 0.5
        XCTAssertEqual(view.layer.shadowOpacity, 0.5)
    }
    
    func testShadowRadius() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: frame)
        view.layer.shadowRadius = 0
        XCTAssertEqual(view.shadowRadius, 0)
        view.shadowRadius = 0.5
        XCTAssertEqual(view.layer.shadowRadius, 0.5)
    }
    
    func testFirstResponder() {
        // When there's no firstResponder
        XCTAssertNil(UIView().firstResponder())
        
        let window = UIWindow()
        
        // When self is firstResponder
        let txtView = UITextField(frame: CGRect.zero)
        window.addSubview(txtView)
        txtView.becomeFirstResponder()
        XCTAssertTrue(txtView.firstResponder() === txtView)
        
        // When a subview is firstResponder
        let superView = UIView()
        window.addSubview(superView)
        let subView = UITextField(frame: CGRect.zero)
        superView.addSubview(subView)
        subView.becomeFirstResponder()
        XCTAssertTrue(superView.firstResponder() === subView)
        
        // When you have to find recursively
        XCTAssertTrue(window.firstResponder() === subView)
        
    }
    
    func testRoundCorners() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: frame)
        view.roundCorners([.allCorners], radius: 5.0)
        
        let maskPath = UIBezierPath(roundedRect: view.bounds,
                                    byRoundingCorners: [.allCorners],
                                    cornerRadii: CGSize(width: 5.0, height: 5.0))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        XCTAssertEqual(view.layer.mask?.bounds, shape.bounds)
        XCTAssertEqual(view.layer.mask?.cornerRadius, shape.cornerRadius)
    }
    
    func testAddShadow() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: frame)
        view.addShadow(ofColor: .red, radius: 5.0, offset: .zero, opacity: 0.5)
        XCTAssertEqual(view.shadowColor, UIColor.red)
        XCTAssertEqual(view.shadowRadius, 5.0)
        XCTAssertEqual(view.shadowOffset, CGSize.zero)
        XCTAssertEqual(view.shadowOpacity, 0.5)
    }
}
#endif
