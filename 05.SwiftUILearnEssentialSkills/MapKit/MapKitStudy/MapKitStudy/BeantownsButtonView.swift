//
//  BeantownButtonView.swift
//  MapKitStudy
//
//  Created by 정정욱 on 1/7/24.
//

import SwiftUI
import MapKit

struct BeanTownButtons: View {
    
    @Binding var position: MapCameraPosition
    @Binding var searchResults: [MKMapItem]
    var visibleRegion: MKCoordinateRegion? // 💁 사용자에게 표시되는 지역 내에서 검색되도록 BeantownButton을 업데이트
    
    var body: some View {
        HStack {
            Button {
                search(for: "주차장")
            } label: {
                Label("parking lot", systemImage: "car")
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                search(for: "병원")
            } label: {
                Label("restroom", systemImage: "cross.case")
            }
            .buttonStyle(.borderedProminent)
            
            //💁 부산, 강릉으로 이동 버튼
            Button {
                position = .region(.busan) // 부산 표시
            } label: {
                Label("Busan", systemImage: "figure.open.water.swim")
            }
            .buttonStyle (.bordered)
            
            Button {
                position = .region(.gangneung) // 강릉 표시
            } label: {
                Label("Gangneung", systemImage: "figure.sailing")
            }
            .buttonStyle (.bordered)
            
        }
        .labelStyle(.iconOnly)
    }
    

    
    func search(for query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        
        request.region = visibleRegion ?? MKCoordinateRegion(
            center: .lotteTower,
            span: MKCoordinateSpan (latitudeDelta: 0.0125, longitudeDelta: 0.0125)
            )

        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            searchResults = response?.mapItems ?? []
        }
    }

}
