//
//  String+Extension.swift
//  babylon
//
//  Created by Francesco on 13/01/17.
//  Copyright © 2017 me. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    public func setReadMore(textToFind:String, newTextColor: UIColor) -> Bool {
        let foundRange = self.mutableString.range(of: textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 14), range: foundRange)
            self.addAttribute(NSForegroundColorAttributeName, value: newTextColor, range: foundRange)
            self.addAttribute(NSUnderlineStyleAttributeName, value: 1, range:foundRange)
            return true
        }
        return false
    }
}
