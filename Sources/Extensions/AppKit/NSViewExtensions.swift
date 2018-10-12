//
//  NSViewExtensions.swift
//  SFExtension-macOS
//
//  Created by cy on 2018/10/13.
//  Copyright © 2018 cmapu. All rights reserved.
//

#if canImport(Cocoa)
import Cocoa

// MARK: - Properties
public extension NSView {
    
    /// SwifterSwift: Border width of view; also inspectable from Storyboard.
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return layer?.borderWidth ?? 0
        }
        set {
            wantsLayer = true
            layer?.borderWidth = newValue
        }
    }
}
#endif
