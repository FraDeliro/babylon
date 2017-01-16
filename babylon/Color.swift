//
//  Color.swift
//  babylon
//
//  Created by Francesco on 13/01/17.
//  Copyright © 2017 me. All rights reserved.
//


import UIKit

@objc(ColorPalette)
public protocol ColorPalette {
    static var lighten5: UIColor { get }
    static var lighten4: UIColor { get }
    static var lighten3: UIColor { get }
    static var lighten2: UIColor { get }
    static var lighten1: UIColor { get }
    static var base: UIColor { get }
    static var darken1: UIColor { get }
    static var darken2: UIColor { get }
    static var darken3: UIColor { get }
    static var darken4: UIColor { get }
    
    @objc
    optional static var accent1: UIColor { get }
    
    @objc
    optional static var accent2: UIColor { get }
    
    @objc
    optional static var accent3: UIColor { get }
    
    @objc
    optional static var accent4: UIColor { get }
}

open class Color: UIColor {
	// dark text
    open class materialDarkText {
		open static let primary = Color.black.withAlphaComponent(0.87)
		open static let secondary = Color.black.withAlphaComponent(0.54)
		open static let others = Color.black.withAlphaComponent(0.38)
		open static let dividers = Color.black.withAlphaComponent(0.12)
	}
	
	// light text
    open class materialLightText {
		open static let primary = Color.white
		open static let secondary = Color.white.withAlphaComponent(0.7)
		open static let others = Color.white.withAlphaComponent(0.5)
		open static let dividers = Color.white.withAlphaComponent(0.12)
	}
	
	// red
    open class materialRed: ColorPalette {
		open static let lighten5 = UIColor(red: 255/255, green: 235/255, blue: 238/255, alpha: 1)
		open static let lighten4 = UIColor(red: 255/255, green: 205/255, blue: 210/255, alpha: 1)
		open static let lighten3 = UIColor(red: 239/255, green: 154/255, blue: 154/255, alpha: 1)
		open static let lighten2 = UIColor(red: 229/255, green: 115/255, blue: 115/255, alpha: 1)
		open static let lighten1 = UIColor(red: 229/255, green: 83/255, blue: 80/255, alpha: 1)
		open static let base = UIColor(red: 244/255, green: 67/255, blue: 54/255, alpha: 1)
		open static let darken1 = UIColor(red: 229/255, green: 57/255, blue: 53/255, alpha: 1)
		open static let darken2 = UIColor(red: 211/255, green: 47/255, blue: 47/255, alpha: 1)
		open static let darken3 = UIColor(red: 198/255, green: 40/255, blue: 40/255, alpha: 1)
		open static let darken4 = UIColor(red: 183/255, green: 28/255, blue: 28/255, alpha: 1)
		open static let accent1 = UIColor(red: 255/255, green: 138/255, blue: 128/255, alpha: 1)
		open static let accent2 = UIColor(red: 255/255, green: 82/255, blue: 82/255, alpha: 1)
		open static let accent3 = UIColor(red: 255/255, green: 23/255, blue: 68/255, alpha: 1)
		open static let accent4 = UIColor(red: 213/255, green: 0/255, blue: 0/255, alpha: 1)
	}
    
    // deepPurple
    open class materialDeepPurple: ColorPalette {
        open static let lighten5 = UIColor(red: 237/255, green: 231/255, blue: 246/255, alpha: 1)
        open static let lighten4 = UIColor(red: 209/255, green: 196/255, blue: 233/255, alpha: 1)
        open static let lighten3 = UIColor(red: 179/255, green: 157/255, blue: 219/255, alpha: 1)
        open static let lighten2 = UIColor(red: 149/255, green: 117/255, blue: 205/255, alpha: 1)
        open static let lighten1 = UIColor(red: 126/255, green: 87/255, blue: 194/255, alpha: 1)
        open static let base = UIColor(red: 103/255, green: 58/255, blue: 183/255, alpha: 1)
        open static let darken1 = UIColor(red: 94/255, green: 53/255, blue: 177/255, alpha: 1)
        open static let darken2 = UIColor(red: 81/255, green: 45/255, blue: 168/255, alpha: 1)
        open static let darken3 = UIColor(red: 69/255, green: 39/255, blue: 160/255, alpha: 1)
        open static let darken4 = UIColor(red: 49/255, green: 27/255, blue: 146/255, alpha: 1)
        open static let accent1 = UIColor(red: 179/255, green: 136/255, blue: 255/255, alpha: 1)
        open static let accent2 = UIColor(red: 124/255, green: 77/255, blue: 255/255, alpha: 1)
        open static let accent3 = UIColor(red: 101/255, green: 31/255, blue: 255/255, alpha: 1)
        open static let accent4 = UIColor(red: 98/255, green: 0/255, blue: 234/255, alpha: 1)
    }
}
