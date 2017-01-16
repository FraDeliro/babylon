//
//  GradientView.swift
//  babylon
//
//  Created by Francesco on 14/01/17.
//  Copyright © 2017 me. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class GradientView: UIView {
    
    //MARK: - Outlets & Variables
    @IBInspectable var startColor: UIColor = Color.materialDeepPurple.darken1
    @IBInspectable var endColor: UIColor = Color.white
    @IBInspectable var startLocation: CGFloat = 0.0
    @IBInspectable var endLocation: CGFloat = 0.1
    
    override class var layerClass: AnyClass {
       return CAGradientLayer.self
    }
    
    var gradient: CAGradientLayer {
       return layer as! CAGradientLayer
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.locations = [startLocation as NSNumber, endLocation as NSNumber]
        gradient.colors = [startColor.cgColor, endColor.cgColor]
    }
}
