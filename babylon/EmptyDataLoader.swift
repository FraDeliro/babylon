//
//  EmptyDataLoader.swift
//  babylon
//
//  Created by Francesco on 13/01/17.
//  Copyright © 2017 me. All rights reserved.
//

import UIKit

public extension UITableView {

    public func loader_visibleViews() -> [UIView] {
        return (self.visibleCells as NSArray).value(forKey: "contentView") as! [UIView]

    }
}

extension UIColor {

    static func backgroundGrey() -> UIColor {
        return UIColor(red: (246.0 / 255.0), green: (247.0 / 255.0), blue: (248.0 / 255.0), alpha: 1.0)
    }

    static func gradientFirstColor() -> UIColor {
        return UIColor(red: (238.0 / 255.0), green: (238.0 / 255.0), blue: (238.0 / 255.0), alpha: 1.0)
    }

    static func gradientSecondColor() -> UIColor {
        return UIColor(red: (221.0 / 255.0), green: (221.0 / 255.0), blue: (221.0 / 255.0), alpha: 1.0)
    }
}



public class EmptyDataLoader {
    
    public static func addEmptyDataLoaderToViews( views: [UIView]) {
        CATransaction.begin()
        views.forEach { $0.loader_addEmptyDataLoader() }
        CATransaction.commit()
    }

    public static func removeEmptyDataLoaderFromViews( views: [UIView]) {
        CATransaction.begin()
        views.forEach { $0.loader_removeEmptyDataLoader() }
        CATransaction.commit()
    }

    public static func addEmptyDataLoaderToTableView( table: UITableView) {
        self.addEmptyDataLoaderToViews(views: table.loader_visibleViews())
    }

    public static func removeEmptyDataLoaderFromTableView( table: UITableView) {
        self.removeEmptyDataLoaderFromViews(views: table.loader_visibleViews())
    }
}

class CutoutView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(UIColor.white.cgColor)
        context!.fill(self.bounds)

        for view in (self.superview?.subviews)! {
            if view != self {
                context!.setBlendMode(.clear);
                context!.setFillColor(UIColor.clear.cgColor)
                context!.fill(view.frame)
            }
        }
    }
}

var cutoutHandle: UInt8 = 0
var gradientHandle: UInt8 = 0

extension UIView {

    public func loader_getCutoutView() -> UIView? {
        return objc_getAssociatedObject(self, &cutoutHandle) as! UIView?
    }

    func loader_setCutoutView(aView: UIView) {
        return objc_setAssociatedObject(self, &cutoutHandle, aView, .OBJC_ASSOCIATION_RETAIN)
    }

    func loader_getGradient() -> CAGradientLayer? {
        return objc_getAssociatedObject(self, &gradientHandle) as! CAGradientLayer?
    }

    func loader_setGradient(aLayer: CAGradientLayer) {
        return objc_setAssociatedObject(self, &gradientHandle, aLayer, .OBJC_ASSOCIATION_RETAIN)
    }

    public func loader_addEmptyDataLoader() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
        self.layer.insertSublayer(gradient, at: 0)

        self.configureAndAddAnimationToGradient(gradient: gradient)
        self.addCutoutView()
    }

    public func loader_removeEmptyDataLoader() {
        self.loader_getCutoutView()?.removeFromSuperview()
        self.loader_getGradient()?.removeAllAnimations()
        self.loader_getGradient()?.removeFromSuperlayer()

        for view in self.subviews {
            view.alpha = 1
        }
    }


    func configureAndAddAnimationToGradient( gradient: CAGradientLayer) {
        gradient.startPoint = CGPoint(x: -1.25, y: 0)
        gradient.endPoint = CGPoint(x: 1.25, y: 0)

        gradient.colors = [
            UIColor.backgroundGrey().cgColor,
            UIColor.gradientFirstColor().cgColor,
            UIColor.gradientSecondColor().cgColor,
            UIColor.gradientFirstColor().cgColor,
            UIColor.backgroundGrey().cgColor
        ]

        gradient.locations = [NSNumber(value: -1.25), NSNumber(value: -1.25), NSNumber(value: 0), NSNumber(value: 0.25), NSNumber(value: 1.25)]

        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = [NSNumber(value: 0.0), NSNumber(value: 0.0), NSNumber(value: 0.10), NSNumber(value: 0.25), NSNumber(value: 1)]

        let firstPartValues = [NSNumber(value: 0), NSNumber(value: 1), NSNumber(value: 1)]
        let otherPartValues = [NSNumber(value: 1.15), NSNumber(value: 1.25)]
        let toValues = firstPartValues + otherPartValues

        gradientAnimation.toValue = toValues
        gradientAnimation.repeatCount = Float.infinity
        gradientAnimation.fillMode = kCAFillModeForwards
        gradientAnimation.isRemovedOnCompletion = false
        gradientAnimation.duration = 1
        gradient.add(gradientAnimation, forKey: "locations")

        self.loader_setGradient(aLayer: gradient)

    }

    func addCutoutView() {
        let cutout = CutoutView()
        cutout.frame = self.bounds
        cutout.backgroundColor = UIColor.clear
        self.insertSubview(cutout, at: 1)
        cutout.setNeedsDisplay()

        for view in self.subviews {
            if view != cutout {
                view.alpha = 0
            }
        }
        self.loader_setCutoutView(aView: cutout)
    }
}
