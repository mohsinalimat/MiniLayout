//
//  MiniLayout.swift
//  Minimal AutoLayout convenience layer. Program constraints succinctly.
//
//  Created by Yonat Sharon on 06.04.2015.
//  Copyright (c) 2015 Yonat Sharon. All rights reserved.
//

import UIKit

extension UIView
{
    /// Set constant attribute. Example: constrain(.Width, to: 17)
    func constrain(at: NSLayoutAttribute, to: CGFloat = 0, ratio: CGFloat = 1, relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint
    {
        let constraint = NSLayoutConstraint(item: self, attribute: at, relatedBy: relation, toItem: nil, attribute: .NotAnAttribute, multiplier: ratio, constant: to)
        addConstraint(constraint)
        return constraint
    }

    /// Pin subview at a specific place. Example: constrain(label, at: .Top)
    func constrain(subview: UIView, at: NSLayoutAttribute, diff: CGFloat = 0, ratio: CGFloat = 1, relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint
    {
        let constraint = NSLayoutConstraint(item: subview, attribute: at, relatedBy: relation, toItem: self, attribute: at, multiplier: ratio, constant: diff)
        addConstraint(constraint)
        return constraint
    }

    /// Pin two subviews to each other. Example:
    ///
    /// constrain(label, at: .Leading, to: textField)
    ///
    /// constrain(textField, at: .Top, to: label, at: .Bottom, diff: 8)
    func constrain(subview: UIView, at: NSLayoutAttribute, to subview2: UIView, at at2: NSLayoutAttribute = .NotAnAttribute, diff: CGFloat = 0, ratio: CGFloat = 1, relation: NSLayoutRelation = .Equal) -> NSLayoutConstraint
    {
        let constraint = NSLayoutConstraint(item: subview, attribute: at, relatedBy: relation, toItem: subview2, attribute: at2, multiplier: ratio, constant: diff)
        addConstraint(constraint)
        return constraint
    }

    /// Add subview pinned to specific places. Example: addConstrainedSubview(button, constrain: .CenterX, .CenterY)
    func addConstrainedSubview(subview: UIView, constrain: NSLayoutAttribute...) -> [NSLayoutConstraint]
    {
        subview.setTranslatesAutoresizingMaskIntoConstraints(false)
        addSubview(subview)
        return constrain.map { self.constrain(subview, at: $0) }
    }
}
