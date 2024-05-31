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
        
        //        mapViewConfigure()
    }
    var latitudeList: [Double] = []
    var longitudeList: [Double] = []
    var restaurantname: [String] = []
    
    func filterRestaurant(for category: String) {
        latitudeList.removeAll()
        longitudeList.removeAll()
        restaurantname.removeAll()
        
        for restaurant in restaurantList {
            if restaurant.category == category {
                latitudeList.append(restaurant.latitude)
                longitudeList.append(restaurant.longitude)
                restaurantname.append(restaurant.name)
                
            } else if category == "전체" {
                //                var initialRegion: MKCoordinateRegion?
                //                initialRegion = mapView.region
                //                if let initialRegion = initialRegion {
                //                    mapView.setRegion(initialRegion, animated: true)
                //                    mapView.removeAnnotations(mapView.annotations)
                
                print("몰라.. 어떻게 구현하는 거지")
            }
        }
        print(latitudeList, longitudeList)
        print(restaurantname)
        // 여기에 latitudes와 longitudes를 사용하여 지도 업데이트 코드를 추가할 수 있습니다.
        mapViewConfigure()
        
    }
    
    @objc func filterButtonTapped() {
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
        
        mapView.removeAnnotations(mapView.annotations) // 기존의 어노테이션 제거
        
        for index in 0..<latitudeList.count {
            let latitude = latitudeList[index]
            let longitude = longitudeList[index]
            let name = restaurantname[index]
            
            let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 700, longitudinalMeters: 700)
            let annotaion = MKPointAnnotation()
            annotaion.coordinate = center
            annotaion.title = name
            mapView.addAnnotation(annotaion)
            print("잘 되고 있군")
        }
        print("굿")
    }
}




