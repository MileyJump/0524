//
//  MapViewController.swift
//  0524
//
//  Created by 최민경 on 5/31/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var restaurantList = RestaurantList().restaurantArray
    
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let right = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterButtonTapped))
        navigationItem.rightBarButtonItem = right
        
    }
    var latitude: [Double] = []
    var longitude: [Double] = []
    
    func filterRestaurant(for category: String) {
        latitude.removeAll()
        longitude.removeAll()
        
        for restaurant in restaurantList {
            if category == "전체" || restaurant.category == category {
                latitude.append(restaurant.latitude)
                longitude.append(restaurant.longitude)
            }
        }
        print(latitude, longitude)
        // 여기에 latitudes와 longitudes를 사용하여 지도 업데이트 코드를 추가할 수 있습니다.
    }
    
    @objc func filterButtonTapped() {
        print("Dd")
        let categories = ["전체", "한식", "중식", "카페", "분식", "일식", "경양식", "양식"]
        let handlers: [(UIAlertAction) -> Void] = [
            { _ in self.filterRestaurant(for: "전체")},
            { _ in self.filterRestaurant(for: "한식")},
            { _ in self.filterRestaurant(for: "중식")},
            { _ in self.filterRestaurant(for: "카페")},
            { _ in self.filterRestaurant(for: "분식")},
            { _ in self.filterRestaurant(for: "일식")},
            { _ in self.filterRestaurant(for: "경양식")},
            { _ in self.filterRestaurant(for: "양식")}
        ]
        
        
        
        
        let sheet = UIAlertController.createActionSheet(withTitles: categories, handlers: handlers)
        
        
        present(sheet, animated: true)
    }
    
    func mapViewConfigure() {
        
        
    }
    
}



