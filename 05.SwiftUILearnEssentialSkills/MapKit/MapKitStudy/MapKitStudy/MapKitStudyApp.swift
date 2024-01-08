//
//  MapKitStudyApp.swift
//  MapKitStudy
//
//  Created by 정정욱 on 1/7/24.
//

import SwiftUI
import CoreLocation

@main
struct MapKitStudyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization() // 또는 requestAlwaysAuthorization()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways {
            // 위치 권한이 승인되면 이 부분에서 필요한 동작을 수행할 수 있습니다.
        } else {
            // 위치 권한이 거부되었을 때 처리할 내용을 추가하세요.
        }
    }
}

