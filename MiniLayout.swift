import UIKit

extension UIView {

    /// Set constant attribute. Example: constrain(.Width, to: 17)
    func constrain(at: NSLayoutAttribute, to: CGFloat = 0, ratio: CGFloat = 1, relation: NSLayoutRelation = .Equal) {
        addConstraint( NSLayoutConstraint(item: self, attribute: at, relatedBy: relation, toItem: nil, attribute: .NotAnAttribute, multiplier: ratio, constant: to) )
    }

    /// Pin subview at a specific place. Example: constrain(label, at: .Top)
    func constrain(subview: UIView, at: NSLayoutAttribute, diff: CGFloat = 0, ratio: CGFloat = 1, relation: NSLayoutRelation = .Equal) {
        addConstraint( NSLayoutConstraint(item: subview, attribute: at, relatedBy: relation, toItem: self, attribute: at, multiplier: ratio, constant: diff) )
    }

    /// Pin two subviews to each other. Example:
    ///
    /// constrain(label, at: .Leading, to: textField)
    ///
    /// constrain(textField, at: .Top, to: label, at: .Bottom, diff: 8)
    func constrain(subview: UIView, at: NSLayoutAttribute, to subview2: UIView, at at2: NSLayoutAttribute = .NotAnAttribute, diff: CGFloat = 0, ratio: CGFloat = 1, relation: NSLayoutRelation = .Equal) {
        addConstraint( NSLayoutConstraint(item: subview, attribute: at, relatedBy: relation, toItem: subview2, attribute: at2, multiplier: ratio, constant: diff) )
    }

    /// Add subview pinned to specific places. Example: addConstrainedSubview(button, constrain: .CenterX, .CenterY)
    func addConstrainedSubview(subview: UIView, constrain: NSLayoutAttribute...) {
        subview.setTranslatesAutoresizingMaskIntoConstraints(false)
        addSubview(subview)
        constrain.map { self.constrain(subview, at: $0) }
    }
}