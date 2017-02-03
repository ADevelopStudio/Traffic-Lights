//
//  Extentions.swift
//  Traffic Lights
//
//  Created by Dmitrii Zverev on 3/2/17.
//
//

import Foundation
import UIKit

extension UIView {
    func setCorner(radius: CGFloat = 7, color: UIColor = .darkGray, width: CGFloat = 1)  {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        self.layer.cornerRadius =  radius
    }
}
