//
//  UIScrollViewExtensionsTest.swift
//  SFExtension-iOSTests
//
//  Created by melon on 2018/12/11.
//  Copyright © 2018 cmapu. All rights reserved.
//

import XCTest
@testable import SFExtension

#if canImport(UIKit) && !os(watchOS)
import UIKit

class UIScrollViewExtensionsTest: XCTestCase {

    func testSnapshot() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let scroll = UIScrollView(frame: frame)
        scroll.contentSize = frame.size
        let snapshot = scroll.snapshot
        XCTAssertNotNil(snapshot)
        let view = UIScrollView()
        XCTAssertNil(view.snapshot)
    }

}
#endif
