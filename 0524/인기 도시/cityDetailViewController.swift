//
//  cityDetailViewController.swift
//  0524
//
//  Created by 최민경 on 5/29/24.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    static let indentifier = "CityDetailViewController"

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem?.tintColor = .black
        navigationItem.title = "관광지 화면"
 
    }
    

}
