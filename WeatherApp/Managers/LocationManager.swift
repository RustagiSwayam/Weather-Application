//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Swayam Rustagi on 02/02/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D? //gets user location, using ? incase user denies
    @Published var isLoading = false
    
    override init(){
        super.init()
        manager.delegate = self
    }
     
    func requestLocation(){
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation ]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    //error handliing
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error loading location: \(error.localizedDescription)")
        isLoading = false
    }
}
