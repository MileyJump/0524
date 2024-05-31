//
//  PopularCityTableViewCell.swift
//  0524
//
//  Created by 최민경 on 5/29/24.
//

import UIKit
import Kingfisher

class PopularCityTableViewCell: UITableViewCell {
    
    
    
    
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityBackgroundView: UIView!
    @IBOutlet var subTitleLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }

    func configureLayout() {
        cityNameLabel.font = .boldSystemFont(ofSize: 20)
        cityNameLabel.textColor = .white
        
        subTitleLabel.setUpLabelUI(fontSize: 14, colorName: .white)
        cityBackgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        cityImageView.contentMode = .scaleAspectFill
        
        cityImageView.layer.shadowColor = UIColor.black.cgColor
        
        // 그림자의 위치 -> x쪽으로 +20, y쪽으로 +15 떨어진 곳으로 부터 그림자를 그리겠다
        cityImageView.layer.shadowOffset = CGSize(width: 20, height: 15)
        
        // 그림자 투명도
        cityImageView.layer.shadowOpacity = 0.5
        
        // 그림자의 블러 정도 지정 (0이 선 처럼 진한 그림자)
        cityImageView.layer.shadowRadius = 10
        
        // 모양 커스텀
        cityImageView.layer.shadowPath = nil
        
        cityImageView.layer.masksToBounds = false
        
       
    }
    
    func configureCell(_ data: City) {
        
        cityNameLabel.text = "\(data.city_name) | \(data.city_english_name)"
        subTitleLabel.text = data.city_explain
        cityImageView.kf.setImage(with: data.url)
        
    }
    
    func setupCornerRadius() {
        let path = UIBezierPath(roundedRect: cityImageView.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 20, height: 20))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        cityImageView.layer.mask = mask
        cityImageView.layer.masksToBounds = true
        
        let viewPath = UIBezierPath(roundedRect: cityBackgroundView.bounds, byRoundingCorners: [.bottomRight], cornerRadii: CGSize(width: 20, height: 20))
        let viewMask = CAShapeLayer()
        viewMask.path = viewPath.cgPath
        cityBackgroundView.layer.mask = viewMask
        cityBackgroundView.layer.masksToBounds = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCornerRadius()
    }
    
}
