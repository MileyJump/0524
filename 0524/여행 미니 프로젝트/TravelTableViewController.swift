//
//  TravelTableViewController.swift
//  0524
//
//  Created by 최민경 on 5/26/24.
//

import UIKit
import Kingfisher



class TravelTableViewController: UITableViewController {
    
    let list = MagazineInfo().magazine
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 480
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.identifiler, for: indexPath) as! TravelTableViewCell
        
        cell.configureCell(list[indexPath.row])
        
        return cell
    }
}
