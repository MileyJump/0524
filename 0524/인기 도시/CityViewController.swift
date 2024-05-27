//
//  CityViewController.swift
//  0524
//
//  Created by 최민경 on 5/27/24.
//

import UIKit

class CityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet var cityTableView: UITableView!
    var travelList = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 관광지 셀 등록
        let cityXib = UINib(nibName: "CityTableViewCell", bundle: nil)
        cityTableView.register(cityXib, forCellReuseIdentifier: "CityTableViewCell")
        
        // 광고 셀 등록
        let adXib = UINib(nibName: "ADTableViewCell", bundle: nil)
        cityTableView.register(adXib, forCellReuseIdentifier: "ADTableViewCell")
        
        // 부하 직원 연결!!
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        cityTableView.rowHeight = 120
        
        
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        print(sender.tag)
        travelList[sender.tag].like?.toggle()
        cityTableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        travelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityCell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        
        let adCell = tableView.dequeueReusableCell(withIdentifier: "ADTableViewCell", for: indexPath) as! ADTableViewCell
        
        cityCell.configureCell(data: travelList[indexPath.row])
        adCell.configureCell(data: travelList[indexPath.row])
        
        cityCell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        cityCell.likeButton.tag = indexPath.row
        
        if travelList[indexPath.row].ad! {
            return adCell
        } else {
            return cityCell
        }
    }
}
