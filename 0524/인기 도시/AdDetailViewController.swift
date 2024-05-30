//
//  AdDetailViewControllerViewController.swift
//  0524
//
//  Created by 최민경 on 5/29/24.
//

import UIKit

class AdDetailViewController: UIViewController {
    
    static let indentifier = "AdDetailViewController"
    
    var data: Travel?
    var customColor: UIColor?
    
    @IBOutlet var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let left = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(rightButtonTapped))
        navigationItem.leftBarButtonItem = left
        
        navigationController?.navigationBar.tintColor = .black
        
        navigationItem.title = "광고 화면"
        
        titleLabel.text = data?.title
        
        view.backgroundColor = customColor
        
    }
    
    @objc func rightButtonTapped(){
        dismiss(animated: true)
    }
    
    
}
