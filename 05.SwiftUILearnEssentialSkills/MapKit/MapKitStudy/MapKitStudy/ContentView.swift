//
//  ContentView.swift
//  MapKitStudy
//
//  Created by 정정욱 on 1/7/24.
//

import SwiftUI
import MapKit
//import os

@MainActor class LocationsHandler: ObservableObject {
    
    static let shared = LocationsHandler()
    public let manager: CLLocationManager

    init() {
        self.manager = CLLocationManager()
        if self.manager.authorizationStatus == .notDetermined {
            self.manager.requestWhenInUseAuthorization()
        }
    }
}


extension CLLocationCoordinate2D {
    static let lotteTower = CLLocationCoordinate2D(latitude: 37.5125, longitude: 127.102778)
}

extension MKCoordinateRegion {
    static let busan = MKCoordinateRegion (
        center: CLLocationCoordinate2D( latitude: 35.1795543, longitude: 129.0756416),
        span: MKCoordinateSpan ( latitudeDelta: 0.1, longitudeDelta: 0.1)
    ) // 도시좌표
    
    static let gangneung = MKCoordinateRegion (
        center: CLLocationCoordinate2D( latitude: 37.751853, longitude: 128.8760574),
        span: MKCoordinateSpan( latitudeDelta: 0.5, longitudeDelta: 0.5)
    ) // 해안 좌표
}


struct ContentView: View {
    
    //let logger = Logger(subsystem: "net.appsird.multimap", category: "Demo")
    @ObservedObject var locationsHandler = LocationsHandler.shared
    
    @State private var visibleRegion: MKCoordinateRegion?
    
    @State private var position: MapCameraPosition = .userLocation(followsHeading: true, fallback: .automatic)
    
    
    @State private var searchResults: [MKMapItem] = []
    
    @State private var selectedResult: MKMapItem?
    

    @State private var route: MKRoute?
    
    var body: some View {
  
        Map(position: $position, selection: $selectedResult){
                        
            ForEach(searchResults, id: \.self) {result in
                Marker(item: result)
            }
            .annotationTitles(.hidden)
            
            if let route {
                MapPolyline(route)
                    .stroke(.blue, lineWidth: 5)
            }

            UserAnnotation()
        }
        .mapStyle(.standard(elevation: .realistic))
        .safeAreaInset(edge: .bottom) {
            HStack {
                Spacer()
                VStack(spacing:0) {
                    if let selectedResult {
                        ItemInfoView(selectedResult: selectedResult, route: route)
                            .frame(height: 128)
                            .clipShape(RoundedRectangle (cornerRadius: 10))
                            .padding([.top, .horizontal])
                    }
                    
                    BeanTownButtons(position: $position, searchResults: $searchResults, visibleRegion: visibleRegion)
                        .padding(.top)
                    
                }
                Spacer()
                
            }
            .background(.ultraThinMaterial)
        }
        .onChange(of: searchResults) {
            withAnimation{
                position = .automatic
           }
        }
        .onChange(of: selectedResult) {
            getDirections()
        }
        .onMapCameraChange { context in
            visibleRegion = context.region
        }
        .mapControls { // 이제 버튼을 탭하여 내 위치를 표시할 수 있습니다. 내가 움직일 때 지도 카메라가 나를 따라다닐 것입니다.
            MapUserLocationButton() // 누르면 내 위치로 바로 이동함, 내가 이동하면 카메라도 이동함
            MapCompass()
            MapScaleView()
            /*
             mapControls 설정은 지도를 회전하면 나침반을 띄우고 화면을 확대하거나 축소하면 축적을 표시함
             */
        }

    }
    
    
    
    func getDirections() {
        route = nil
        guard let selectedResult else { return }
        
        let location = locationsHandler.manager.location
        guard let coordinate = location?.coordinate else { return }

        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        request.destination = selectedResult
        
        Task {
            let directions = MKDirections(request: request)
            let response = try? await directions.calculate()
            route = response?.routes.first
        }
    }
    
}


#Preview {
    ContentView()
}
