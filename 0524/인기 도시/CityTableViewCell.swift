//
//  CityTableViewCell.swift
//  0524
//
//  Created by 최민경 on 5/27/24.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    
 
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
  
    @IBOutlet var scopeButton1: UIImageView!
    @IBOutlet var scopeButton2: UIImageView!
    @IBOutlet var scopeButton3: UIImageView!
    @IBOutlet var scopeButton4: UIImageView!
    @IBOutlet var scopeButton5: UIImageView!
    
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var saveLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    
    lazy var starButtonArray = [scopeButton1, scopeButton2, scopeButton3, scopeButton4, scopeButton5]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    func configureLayout(){
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textColor = .black
        
        descriptionLabel.setUpLabelUI(fontSize: 14, colorName: .darkGray)
        
        saveLabel.setUpLabelUI(fontSize: 13, colorName: .lightGray)
        
        travelImageView.backgroundColor = .darkGray
        travelImageView.layer.cornerRadius = 8
        travelImageView.contentMode = .scaleAspectFill
        
        likeButton.tintColor = .white
        
        for button in starButtonArray {
            button?.tintColor = .lightGray
        }
        
        
    }
    
    
    func configureCell(data: Travel) {
        guard let grade = data.grade else { return }
        guard let like = data.like else { return }
        
        titleLabel.text = data.titleDescription
        descriptionLabel.text = data.subtitleDescription
        saveLabel.text = data.descriptionLabel
        
        travelImageView.kf.setImage(with: data.cityImageURL)

        
        let likeImage = like ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: likeImage), for: .normal)
        

        // grade에 따라 satrButton 옐로우 색상 채우기
        for (index, button) in starButtonArray.enumerated() {
            button?.tintColor = index < Int(grade) ? .systemYellow : .lightGray
        }
    }
}
