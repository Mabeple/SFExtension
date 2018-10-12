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
}
#endif
