//
//  TravelTableViewCell.swift
//  0524
//
//  Created by 최민경 on 5/26/24.
//

import UIKit

class TravelTableViewCell: UITableViewCell {
    
    
    static let identifiler = "TravelTableViewCell"
 
    @IBOutlet var travelImageView: UIImageView?
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configuraUI()
    }
    
    func configuraUI() {
        
        
        travelImageView?.contentMode = .scaleToFill
        travelImageView?.backgroundColor = .blue
        travelImageView?.layer.cornerRadius = 8
        

//        titleLabel.text = list[indexPath.row].title
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 2
        
        subTitleLabel.setUpLabelUI(fontSize: 15, colorName: .darkGray)
        dateLabel.setUpLabelUI(fontSize: 15, colorName: .darkGray)
        
    }
    
    func configureCell(_ data: Magazine) {
        titleLabel.text = data.titleDescription
        subTitleLabel.text = data.subtitleDescription
        
        let url = URL(string: data.photo_image)
        travelImageView?.kf.setImage(with: url)
        
        let inputDateformatter = DateFormatter()
       inputDateformatter.dateFormat = "yyMMdd"
       
       let outputDateformatter = DateFormatter()
       outputDateformatter.dateFormat = "yy년 MM월 dd일"
       
       
        if let date = inputDateformatter.date(from: data.date) {
           dateLabel.text = outputDateformatter.string(from: date)
       } else {
           dateLabel.text = data.date
       }
        
    }
    
    
    
}
