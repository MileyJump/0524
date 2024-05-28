//
//  ADTableViewCell.swift
//  0524
//
//  Created by 최민경 on 5/27/24.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    static let identifier = "ADTableViewCell"
    
    @IBOutlet var adLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    
    
    // 초기 셋팅
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    func configureLayout() {
        adLabel.layer.cornerRadius = 6
        adLabel.clipsToBounds = true
        adLabel.text = "AD"
        adLabel.setUpLabelUI(fontSize: 16, colorName: .black)
        
        titleLabel.font = .boldSystemFont(ofSize: 18)
        
        layer.cornerRadius = 16
    
        self.backgroundColor = .randomColor()
        
    }
    
    func configureCell(data: Travel) {
        
        titleLabel.text = data.title
    }    
}
