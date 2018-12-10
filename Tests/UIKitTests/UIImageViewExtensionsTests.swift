//
//  UIImageViewExtensionsTests.swift
//  SFExtension-iOSTests
//
//  Created by melon on 2018/12/10.
//  Copyright © 2018 cmapu. All rights reserved.
//

import XCTest
@testable import SFExtension

#if canImport(UIKit)
import UIKit

class UIImageViewExtensionsTests: XCTestCase {

    func testBlur() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 100))
        imageView.blur(withStyle: .dark)
        
        let blurView = imageView.subviews.first as? UIVisualEffectView
        XCTAssertNotNil(blurView)
        XCTAssertNotNil(blurView?.effect)
        XCTAssertEqual(blurView?.frame, imageView.bounds)
        XCTAssertEqual(blurView?.autoresizingMask, [.flexibleWidth, .flexibleHeight])
        XCTAssert(imageView.clipsToBounds)
    }
    
    func testBlurred() {
        let imageView = UIImageView()
        let blurredImageView = imageView.blurred(withStyle: .extraLight)
        XCTAssertEqual(blurredImageView, imageView)
    }

}
#endif
