//
//  UILabel+Extension.swift
//  0524
//
//  Created by 최민경 on 5/27/24.
//

import UIKit

extension UILabel {
    
    func setUpLabelUI(fontSize: CGFloat, colorName: UIColor) {
        self.font = .systemFont(ofSize: fontSize)
        self.textColor = colorName
    }
    
}
