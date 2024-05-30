//
//  CityViewController.swift
//  0524
//
//  Created by 최민경 on 5/27/24.
//

import UIKit

class CityViewController: UIViewController {
    
    @IBOutlet var cityTableView: UITableView!
    var travelList = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    func configureTableView() {
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
        
        navigationItem.backButtonTitle = ""
        
        
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        print(sender.tag)
        travelList[sender.tag].like?.toggle()
        cityTableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    
}

extension CityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        travelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let isAd = travelList[indexPath.row].ad, isAd {
            let adCell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as! ADTableViewCell
            adCell.configureCell(data: travelList[indexPath.row])
            return adCell
        } else {
            let cityCell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as! CityTableViewCell
            
            cityCell.configureCell(data: travelList[indexPath.row])
            cityCell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
            cityCell.likeButton.tag = indexPath.row
            
            return cityCell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if let ad = travelList[indexPath.row].ad, ad {
             let vc = storyboard?.instantiateViewController(withIdentifier: AdDetailViewController.indentifier) as! AdDetailViewController
            let nvc = UINavigationController(rootViewController: vc)
            vc.data = travelList[indexPath.row]
            
            // AD 셀의 배경 색상을 전달
            if let adCell = tableView.cellForRow(at: indexPath) as? ADTableViewCell {
                vc.customColor = adCell.backgroundColor
            }
            
            
            nvc.modalPresentationStyle = .fullScreen
            
            present(nvc, animated: true)
           
        } else {
            let vc = storyboard?.instantiateViewController(withIdentifier: CityDetailViewController.indentifier ) as! CityDetailViewController
            vc.data = travelList[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
