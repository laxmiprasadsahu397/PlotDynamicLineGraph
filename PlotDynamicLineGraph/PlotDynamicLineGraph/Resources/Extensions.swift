//
//  Extensions.swift
//  PlotDynamicLineGraph
//
//  Created by LaxmiPrasad Sahu on 26/03/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import UIKit


extension String {
    func size(withSystemFontSize pointSize: CGFloat) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: pointSize)])
    }
}

extension CGPoint {
    func adding(x: CGFloat) -> CGPoint { return CGPoint(x: self.x + x, y: self.y) }
    func adding(y: CGFloat) -> CGPoint { return CGPoint(x: self.x, y: self.y + y) }
}
