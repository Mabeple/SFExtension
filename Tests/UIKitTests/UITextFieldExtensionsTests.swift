//
//  UITextFieldExtensionsTests.swift
//  SFExtension-iOSTests
//
//  Created by melon on 2018/12/11.
//  Copyright © 2018 cmapu. All rights reserved.
//

import XCTest
@testable import SFExtension

#if canImport(UIKit)
import UIKit

class UITextFieldExtensionsTests: XCTestCase {
    
    func testIsEmpty() {
        let textField = UITextField()
        XCTAssert(textField.isEmpty)
        textField.text = "Hello"
        XCTAssertFalse(textField.isEmpty)
        textField.text = nil
        XCTAssert(textField.isEmpty)
    }
    
    func testTrimmedText() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        let textField = UITextField(frame: frame)
        textField.text = "Hello \n    \n"
        XCTAssertNotNil(textField.trimmedText)
        XCTAssertEqual(textField.trimmedText!, "Hello")
    }
    
    func testLeftViewTintColor() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        let textField = UITextField(frame: frame)
        
        let imageView = UIImageView()
        imageView.tintColor = .red
        
        textField.leftView = imageView
        XCTAssertEqual(textField.leftViewTintColor, .red)
        
        textField.leftViewTintColor = .blue
        XCTAssertEqual(textField.leftViewTintColor, .blue)
        
        textField.leftView = nil
        XCTAssertNil(textField.leftViewTintColor)
        
        textField.leftViewTintColor = .yellow
        XCTAssertNil(textField.leftViewTintColor)
    }
    
    func testRightViewTintColor() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        let textField = UITextField(frame: frame)
        
        let imageView = UIImageView()
        imageView.tintColor = .red
        
        textField.rightView = imageView
        XCTAssertEqual(textField.rightViewTintColor, .red)
        
        textField.rightViewTintColor = .blue
        XCTAssertEqual(textField.rightViewTintColor, .blue)
        
        textField.rightView = nil
        XCTAssertNil(textField.rightViewTintColor)
        
        textField.rightViewTintColor = .yellow
        XCTAssertNil(textField.rightViewTintColor)
    }
    
    func testClear() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        let textField = UITextField(frame: frame)
        textField.text = "Hello"
        textField.clear()
        XCTAssertEqual(textField.text!, "")
    }
    
    func testSetPlaceHolderTextColor() {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Attributed Placeholder")
        textField.setPlaceHolderTextColor(.blue)
        let color = textField.attributedPlaceholder?.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor
        XCTAssertEqual(color, .blue)
        
        textField.placeholder = nil
        textField.setPlaceHolderTextColor(.yellow)
        let emptyColor = textField.attributedPlaceholder?.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor
        XCTAssertNil(emptyColor)
    }
    
    func testAddPaddingLeft() {
        let textfield = UITextField()
        textfield.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        textfield.addPaddingLeft(40)
        XCTAssertEqual(textfield.leftView?.frame.width, 40)
    }
    
    func testAddPaddingRight() {
        let textfield = UITextField()
        textfield.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        textfield.addPaddingRight(40)
        XCTAssertEqual(textfield.rightView?.frame.width, 40)
    }
    
    func testAddPaddingLeftImageIcon() {
        let textfield = UITextField()
        textfield.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
        
        let bundle = Bundle.init(for: UIImageExtensionsTests.self)
        let image = UIImage(named: "TestImage", in: bundle, compatibleWith: nil)!
        textfield.addPaddingLeftIcon(image, padding: 5)
        XCTAssertEqual(textfield.leftView?.frame.width, image.size.width + 5)
    }
    
    func testAddPaddingRightImageIcon() {
        let textfield = UITextField()
        textfield.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
        let bundle = Bundle.init(for: UIImageExtensionsTests.self)
        let image = UIImage(named: "TestImage", in: bundle, compatibleWith: nil)!
        textfield.addPaddingRightIcon(image, padding: 5)
        XCTAssertEqual(textfield.rightView?.frame.width, image.size.width + 5)
    }
}
#endif
