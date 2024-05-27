//
//  ADTableViewCell.swift
//  0524
//
//  Created by 최민경 on 5/27/24.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    
    @IBOutlet var adLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    
    
    // 초기 셋팅
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
        
        let color = UIColor()
        self.backgroundColor = color.randomColor()
    }
    
    func configureLayout() {
        adLabel.layer.cornerRadius = 6
        adLabel.layer.borderColor = UIColor.black.cgColor
        adLabel.clipsToBounds = true
        adLabel.text = "AD"
        adLabel.textColor = .black
        adLabel.font = .systemFont(ofSize: 16)
        
        titleLabel.font = .boldSystemFont(ofSize: 18)
        
        layer.cornerRadius = 16
        
    }
    
    func configureCell(data: Travel) {
        
        titleLabel.text = data.title
 
    }    
}
