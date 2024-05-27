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
        
        scopeButton1.tintColor = .lightGray
        scopeButton2.tintColor = .lightGray
        scopeButton3.tintColor = .lightGray
        scopeButton4.tintColor = .lightGray
        scopeButton5.tintColor = .lightGray
        
    }
    
    
    func configureCell(data: Travel) {
        guard let grade = data.grade else { return }
        guard let save = data.save else { return }
        guard let image = data.travel_image else { return }
        guard let like = data.like else { return }
        
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        saveLabel.text = "(\(grade)) · 저장 \(save.formatted())"
        
        let url = URL(string: image)
        travelImageView.kf.setImage(with: url)
//        let starImage = UIImage(systemName: "star.fill")
//        let emptyStarImage = UIImage(systemName: "star")
        
        let likeImage = like ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: likeImage), for: .normal)
        
        // 평점 반복문 사용
        let starButton = [scopeButton1, scopeButton2, scopeButton3, scopeButton4, scopeButton5]
        
        for (index, button) in starButton.enumerated() { 
            button?.tintColor = index < Int(grade) ? .systemYellow : .lightGray
        }
       
        // 평점 스위치문으로 사용
//        switch grade {
//        case ...1 : scopeButton1.image = starImage
//        case 1.1...2: 
//            scopeButton1.image = starImage
//            scopeButton2.image = starImage
//        case 2.1...3:
//            scopeButton1.image = starImage
//            scopeButton2.image = starImage
//            scopeButton3.image = starImage
//        case 3.1...4: 
//            scopeButton1.image = starImage
//            scopeButton2.image = starImage
//            scopeButton3.image = starImage
//            scopeButton4.image = starImage
//        case 4.1...5: 
//            scopeButton1.image = starImage
//            scopeButton2.image = starImage
//            scopeButton3.image = starImage
//            scopeButton4.image = starImage
//            scopeButton5.image = starImage
//        default:
//            print("오류")
//        }
        
    }
}
