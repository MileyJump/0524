//
//  PopularCityViewController.swift
//  0524
//
//  Created by 최민경 on 5/29/24.
//

import UIKit

class PopularCityViewController: UIViewController {
    
    var list = CityInfo().city
    var filterList: [City] = []
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var citySegmented: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        filterList = list
        citySegmented.addTarget(self, action: #selector(segmentedTapped), for: .valueChanged)
        searchBar.searchTextField.addTarget(self, action: #selector(searchTextField), for: .editingChanged)
    }
    
    @objc func searchTextField() {
        
        guard let text = searchBar.text else { return }
        print(text)
        
        var searchlist: [City] = []
        
        if text.isEmpty {
            filterList = list
        } else {
            for item in list {
                if item.city_name.contains(text) {
                    searchlist.append(item)
                }
            }
            filterList = searchlist
            tableView.reloadData()
        }
    }
    
    @objc func segmentedTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            perfomDomesticSegmentAction()
        case 1:
            perfomDomesticSegmentAction()
        case 2:
            perfomDomesticSegmentAction()
        default:
            break
        }
    }
    
    func perfomDomesticSegmentAction(){
        print(#function)
        var searchlist: [City] = []
        var segment = citySegmented.selectedSegmentIndex
        
        if segment == 0 {
            filterList = list
            tableView.reloadData()
        } else if citySegmented.selectedSegmentIndex == 1 {
            for city in list {
                if city.domestic_travel {
                    searchlist.append(city)
                }
            }
            filterList = searchlist
            tableView.reloadData()
        } else if citySegmented.selectedSegmentIndex == 2 {
            for city in list {
                if !city.domestic_travel {
                    searchlist.append(city)
                }
            }
            filterList = searchlist
            tableView.reloadData()
        }
    }
    
    func configureUI() {
        tableView.rowHeight = 200
        let nib = UINib(nibName: "PopularCityTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: PopularCityTableViewCell.identifier)
        tableView.separatorStyle = .none
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension PopularCityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopularCityTableViewCell.identifier, for: indexPath) as! PopularCityTableViewCell
        
        cell.configureCell(filterList[indexPath.row])
        
        return cell
    }
}
