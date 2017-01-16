//
//  CuttedImageHeader.swift
//  babylon
//
//  Created by Francesco on 15/01/17.
//  Copyright © 2017 me. All rights reserved.
//

import Foundation
import UIKit

class CuttedImageHeader: UIImageView {
    
    @IBInspectable var kHeaderCutAway: CGFloat = 0.0
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
    var maskLayer: CAShapeLayer {
        return layer as! CAShapeLayer
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        let layer = CAShapeLayer()
        layer.fillColor = Color.black.cgColor
        maskLayer.mask = layer
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height - kHeaderCutAway))
        layer.path = path.cgPath
       
    }
    
}
