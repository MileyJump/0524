//
//  ReuseIdentifierProtocol.swift
//  0524
//
//  Created by 최민경 on 5/31/24.
//

import Foundation
import UIKit

protocol ReuseIdentifierProtocol {
    
    static var identifier: String { get }
    
}

extension UIViewController: ReuseIdentifierProtocol {
    static var identifier: String {
        return "\(self)"
    }
}

extension UITableViewCell: ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}


