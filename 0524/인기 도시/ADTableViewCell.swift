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
    }
    
    func configureLayout() {
        adLabel.layer.cornerRadius = 6
        adLabel.layer.borderColor = UIColor.black.cgColor
        adLabel.clipsToBounds = true
        adLabel.text = "AD"
        adLabel.setUpLabelUI(fontSize: 16, colorName: .black)
        
        titleLabel.font = .boldSystemFont(ofSize: 18)
        
        layer.cornerRadius = 16
        
        
        //        self.backgroundColor = UIColor.randomColor()
        
        
                // => UIColor 확장 했음. UITableViewCell는 UIView의 하위 클래스이고..
                // UIKit 덕분에 UIView는 Color가를 쓸 수 있지 않나..? 그러면 TableViewCell도 UIColor를 쓸 수 있어야 하는거 아닌가..?  왜 인스턴스 찍어야 하는지..
        //      self.backgroundColor = .blue => 여기서 blue가 UIColor인데 사용이 되지 않나?
        
        let color = UIColor()
        self.backgroundColor = color.randomColor()
        
    }
    
    func configureCell(data: Travel) {
        
        titleLabel.text = data.title
 
    }    
}
