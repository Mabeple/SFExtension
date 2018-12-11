//
//  UIStackViewExtensions.swift
//  SFExtension-iOS
//
//  Created by melon on 2018/12/11.
//  Copyright © 2018 cmapu. All rights reserved.
//

#if canImport(UIKit)
import UIKit

// MARK: - Initializers
@available(iOS 9.0, *)
public extension UIStackView {
    
    /// Initialize an UIStackView with an array of UIView and common parameters.
    ///
    ///     let stackView = UIStackView(arrangedSubviews: [UIView(), UIView()], axis: .vertical)
    ///
    /// - Parameters:
    ///   - arrangedSubviews: The UIViews to add to the stack.
    ///   - axis: The axis along which the arranged views are laid out.
    ///   - spacing: The distance in points between the adjacent edges of the stack view’s arranged views.(default: 0.0)
    ///   - alignment: The alignment of the arranged subviews perpendicular to the stack view’s axis. (default: .fill)
    ///   - distribution: The distribution of the arranged views along the stack view’s axis.(default: .fill)
    public convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis,
                            spacing: CGFloat = 0.0,
                            alignment: UIStackView.Alignment = .fill,
                            distribution: UIStackView.Distribution = .fill) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }
    
    /// Adds array of views to the end of the arrangedSubviews array.
    ///
    /// - Parameter views: views array.
    public func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
    
    /// Removes all views in stack’s array of arranged subviews.
    public func removeArrangedSubviews() {
        for view in arrangedSubviews {
            removeArrangedSubview(view)
        }
    }
    
}
#endif

