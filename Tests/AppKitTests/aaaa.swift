//
//  aaaa.swift
//  SFExtension-macOSTests
//
//  Created by cy on 2018/10/13.
//  Copyright © 2018 cmapu. All rights reserved.
//
#if os(macOS)
import XCTest
@testable import SFExtension

final class aaaaTests: XCTestCase {
    func testBorderWidth() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = NSView(frame: frame)
        view.borderWidth = 0
        XCTAssertEqual(view.layer?.borderWidth, 0)
        
        view.borderWidth = 5
        XCTAssertEqual(view.borderWidth, 5)
    }
    
}
#endif
