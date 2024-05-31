//
//  RestaurantTableViewController.swift
//  0524
//
//  Created by 최민경 on 5/26/24.
//

import UIKit
import Kingfisher

class RestaurantTableViewController: UITableViewController {
    
    var restaurantList = RestaurantList().restaurantArray
    var restaurantFilter: [Restaurant] = []
    
    @IBOutlet var searchView: UIView!
    @IBOutlet var searchTextField: UITextField!
    
    @IBOutlet var mapButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tableView.rowHeight = 400
        //        tableView.estimatedRowHeight = 400
        //        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        setupUI()
        restaurantFilter = restaurantList
        
        let left = UIBarButtonItem(image: UIImage(systemName: "map.fill"), style: .plain, target: self, action: #selector(mapButtonTapped))
        navigationItem.leftBarButtonItem = left
        
        navigationItem.title = "Restaurant"
        
    }
    
    
    @IBAction func searchTextField(_ sender: UITextField) {
        guard let searchText = searchTextField.text else { return }
        searFilter(for: searchText)
        tableView.reloadData()
    }
    
    
    func searFilter(for searchText: String) {
        
        // 🔍 반복문(for-in)을 활용한 검색 기능 🔍
        
        if restaurantFilter.isEmpty {
            restaurantFilter = restaurantList
        } else {
            
            var filterArray: [Restaurant] = []
            
            for filter in restaurantList {
                if filter.name.contains(searchText) || filter.address.contains(searchText) || filter.category.contains(searchText) || filter.phoneNumber.contains(searchText) || filter.price.formatted().contains(searchText) || filter.type.formatted().contains(searchText) {
                    filterArray.append(filter)
                }
            }
            restaurantFilter = filterArray
        }
        
        // 🔍 클로저를 활용한 검색 기능 🔍
        
        //        if searchText.isEmpty {
        //            restaurantList.restaurantFilter = restaurantList.restaurantArray
        //        } else {
        //            restaurantList.restaurantFilter = restaurantList.restaurantArray.filter{ restaurant in
        //                return restaurant.name.contains(searchText) || restaurant.category.contains(searchText) || restaurant.address.contains(searchText) || restaurant.phoneNumber.contains(searchText) || restaurant.price.formatted().contains(searchText)
        //            }
        //        }
        
        tableView.reloadData()
    }
    
    func setupUI(){
        searchView.layer.cornerRadius = 25
        searchView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        
        searchTextField.backgroundColor = .clear
        searchTextField.borderStyle = .none
        searchTextField.placeholder = "Search for it!!"
        
//        mapButton.addTarget(self, action: #selector(mapButtonTapped), for: .touchUpInside)
    }
    
    @objc func mapButtonTapped() {
        print(#function)
        let vc = storyboard?.instantiateViewController(identifier: MapViewController.identifier) as! MapViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func keyBoardEnter(_ sender: UITextField) {
        view.endEditing(true)
    }
    
    
    @objc func heartButtonTapped(sender: UIButton){
        print(sender.tag)
        restaurantFilter[sender.tag].heart.toggle()
        
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    
    
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        restaurantFilter.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as! RestaurantTableViewCell
        
        let restaurant = restaurantFilter[indexPath.row]
        
        // 이미지
        let image = restaurant.image
        let url = URL(string: image)
        cell.restaurantImageView.kf.setImage(with: url)
        cell.restaurantImageView.contentMode = .scaleToFill
        cell.restaurantImageView.layer.cornerRadius = 8
        
        // 카테고리
        cell.categoryLabel.text = "\(restaurant.category) | \(restaurant.price.formatted())원"
        cell.categoryLabel.textColor = .darkGray
        cell.categoryLabel.font = .systemFont(ofSize: 16)
        
        // 이름
        cell.nameLabel.text = restaurant.name
        cell.nameLabel.font = .boldSystemFont(ofSize: 20)
        
        // 주소
        cell.addressLabel.text = restaurant.address
        cell.addressLabel.font = .systemFont(ofSize: 16)
        cell.addressLabel.numberOfLines = 0
        
        // 전화번호
        cell.phoneNumberLabel.text = restaurant.phoneNumber
        cell.phoneNumberLabel.font = .systemFont(ofSize: 16)
        
        
        // 하트버튼
        cell.heartButton.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
        cell.heartButton.tag = indexPath.row
        
        let heartButtonImage = restaurantFilter[indexPath.row].heart ? "heart.fill" : "heart"
        cell.heartButton.setImage(UIImage(systemName: heartButtonImage), for: .normal)
        
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
    
}
