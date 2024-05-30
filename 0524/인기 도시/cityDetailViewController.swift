//
//  cityDetailViewController.swift
//  0524
//
//  Created by 최민경 on 5/29/24.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    static let indentifier = "CityDetailViewController"
    
    var data: Travel?
    
    
    @IBOutlet var travelImageView: UIImageView!
    
    @IBOutlet var subtitleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem?.tintColor = .black
//        navigationItem.title = "관광지 화면"
        
        navigationItem.title = data?.title
        travelImageView.kf.setImage(with: data?.cityImageURL)
        travelImageView.contentMode = .scaleAspectFill
        subtitleLabel.text = data?.subtitleDescription
        subtitleLabel.numberOfLines = 0
 
    }
    

}
