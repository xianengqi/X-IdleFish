//
//  LocationManager.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/7/22.
//

import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var manager: CLLocationManager = CLLocationManager()
    
    @Published var cityName: String?
    
    override init() {
        super.init()
        
        manager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Dlog(error)
    }
    
    // 该方法为定位成功的代理方法
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last?.coordinate else {
            return
        }
        
        // 通过地理反编码得到位置的详细信息
        let geoc = CLGeocoder()
        
        geoc.reverseGeocodeLocation(CLLocation(latitude: location.latitude, longitude: location.longitude)) { placemarks, error in
            
            guard let placemark = placemarks?.first else {
                return
            }
            
            // locality就表示当前定位的城市名称
            guard let name = placemark.locality else {
                return
            }
            
            DispatchQueue.main.async {
                print(name)
                // 闲鱼上只显示城市名称，不显示"市"
                
                // 稍后会更新搜索框的竖向推荐的文字滚动列表
                self.cityName = String(name.prefix(name.count - 1))
            }
            
        }
    }
}
