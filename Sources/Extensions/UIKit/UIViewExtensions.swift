//
//  UIViewExtensions.swift
//  SFExtension-iOS
//
//  Created by cy on 2018/10/13.
//  Copyright © 2018 cmapu. All rights reserved.
//

#if canImport(UIKit)
import UIKit
// MARK: - Properties
public extension UIView {
    /// Height of view.
    public var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
}

// MARK: - Methods
public extension UIView {
    
}
#endif
