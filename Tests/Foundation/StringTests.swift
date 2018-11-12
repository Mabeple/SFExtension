//
//  StringTests.swift
//  SFExtension
//
//  Created by cy on 2018/11/12.
//  Copyright © 2018 cmapu. All rights reserved.
//

import XCTest

class StringTests: XCTestCase {
    var helloWorld = "Hello World!"
    
    override func setUp() {
        super.setUp()
        NSTimeZone.default = NSTimeZone.system
    }
    
    func testBase64Decoded() {
        XCTAssertEqual("SGVsbG8gV29ybGQh".base64Decoded, helloWorld)
        XCTAssertNil(helloWorld.base64Decoded)
    }
}
