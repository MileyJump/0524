//
//  UIViewContoller+Extension.swift
//  0524
//
//  Created by 최민경 on 5/31/24.
//

import UIKit


//
//extension UIAlertController {
//    
//    static func createActionSheet(withTitles titles: [String] , handlers: [((UIAlertAction) -> Void)?]) -> UIAlertController {
//        
//        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        
//        for (index, title) in titles.enumerated() {
//            let handler = handlers[index]
//            
//            sheet.addAction(UIAlertAction(title: title, style: .default, handler: handler))
//        }
//        sheet.addAction(UIAlertAction(title: "취소", style: .cancel))
//        
//        return sheet
//    }
//}
//    
//    
//        
//        
//


extension UIAlertController {
    
    static func createActionSheet(withTitles titles: [String], handlers: [((UIAlertAction) -> Void)?]) -> UIAlertController {
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        for (index, title) in titles.enumerated() {
            let handler = handlers[index]
            sheet.addAction(UIAlertAction(title: title, style: .default, handler: handler))
        }
        sheet.addAction(UIAlertAction(title: "취소", style: .cancel))
        
        return sheet
    }
}
