//
//  Extensions.swift
//  Pokedex
//
//  Created by Boris Yue on 3/27/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func setTextSpacing(spacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: text!)
        if textAlignment == .center || textAlignment == .right {
            attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: attributedString.length-1))
        } else {
            attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: attributedString.length))
        }
        attributedText = attributedString
    }
}
