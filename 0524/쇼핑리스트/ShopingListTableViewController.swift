//
//  ShopingListTableViewController.swift
//  0524
//
//  Created by 최민경 on 5/25/24.
//

import UIKit


struct ShopingList {
    var checkButton: Bool
    let checkList: String
    var starButton: Bool
}

class ShopingListTableViewController: UITableViewController {
    @IBOutlet var backgroundUIview: UIView!
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var list = [
    ShopingList(checkButton: false, checkList: "그립톡 구매하기", starButton: false),
    ShopingList(checkButton: false, checkList: "사이다 구매하기", starButton: false),
    ShopingList(checkButton: false, checkList: "아이패드 케이스 최저가 알아보기", starButton: false),
    ShopingList(checkButton: false, checkList: "양말", starButton: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        tableView.rowHeight = 60
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc func addButtonTapped(){
        guard let text = addTextField.text else { return }
        list.append(ShopingList(checkButton: false, checkList: text, starButton: false))
        
        addTextField.text = ""
        
        tableView.reloadData()
    }
    @objc func checkButtonTapped(_ sender: UIButton){
        list[sender.tag].checkButton.toggle()
        tableView.reloadData()
        
    }
    @objc func starButtonTapped(_ sender: UIButton) {
        list[sender.tag].starButton.toggle()
        
        print(sender.tag)
        tableView.reloadData()
    }
    
    func setUpUI(){
        backgroundUIview.backgroundColor = .lightGray.withAlphaComponent(0.2)
        backgroundUIview.layer.cornerRadius = 8
        
        addTextField.placeholder = "무엇을 구매하실 건가요?"
        addTextField.backgroundColor = .clear
        addTextField.borderStyle = .none
        
        addButton.setTitle("추가", for: .normal)
        addButton.backgroundColor = .systemGray.withAlphaComponent(0.2)
        addButton.layer.cornerRadius = 8
        addButton.tintColor = .black
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopingTableViewCell", for: indexPath) as! ShopingListTableViewCell
        let data = list[indexPath.row]
        
        let checkname = data.checkButton ? "checkmark.square.fill" : "checkmark.square"
        let checkimage = UIImage(systemName: checkname)
        cell.checkButton.setImage(checkimage, for: .normal)
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        
        cell.checkListLabel.text = data.checkList
        
        let starname = data.starButton ? "star.fill" : "star"
        let starImage = UIImage(systemName: starname)
        
        cell.starButton.setImage(starImage, for: .normal)
        cell.starButton.tag = indexPath.row
        cell.starButton.addTarget(self, action: #selector(starButtonTapped), for: .touchUpInside)
        
        
        
        cell.backgroundCellView?.backgroundColor = .lightGray.withAlphaComponent(0.2)
        cell.backgroundCellView?.layer.cornerRadius = 8
        cell.starButton.tintColor = .black
        cell.checkButton.tintColor = .black
              
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        list.remove(at: indexPath.row)
        tableView.reloadData()
        
    }
}
