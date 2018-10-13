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
    
    /// Width of view.
    public var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    /// X origin of view.
    public var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    /// Y origin of view.
    public var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    /// Top of View
    public var top: CGFloat {
        get {
            return frame.minY
        }
        set {
            var aframe = frame
            aframe.origin.y = newValue
            frame = aframe
        }
    }
    
    /// Bottom of View
    public var bottom: CGFloat {
        get {
            return frame.maxY
        }
        set {
            var aframe = frame
            aframe.origin.y = newValue - height
            frame = aframe
        }
    }
    
    /// Left of View
    public var left: CGFloat {
        get {
            return frame.minX
        }
        set {
            var aframe = frame
            aframe.origin.x = newValue
            frame = aframe
        }
    }
    
    /// Right of View
    public var right: CGFloat {
        get {
            return frame.maxX
        }
        set {
            var aframe = frame
            aframe.origin.x = newValue - width
            frame = aframe
        }
    }
}

// MARK: - Methods
public extension UIView {
    
}
#endif
