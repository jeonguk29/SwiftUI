//
//  ItemInfoView.swift
//  MapKitStudy
//
//  Created by 정정욱 on 1/7/24.
//

import SwiftUI
import MapKit

struct ItemInfoView: View {
    
    @State private var lookAroundScene: MKLookAroundScene?
    
    let selectedResult: MKMapItem
    let route: MKRoute?

    
    // ItemInfoView.swift - Format travel time for display
    private var travelTime: String? {
        guard let route else { return nil }
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        return formatter.string(from: route.expectedTravelTime)
    }
    
    var body: some View {
        LookAroundPreview(initialScene: lookAroundScene)
            .overlay(alignment: .bottomTrailing) {
                HStack {
                    Text ("\(selectedResult.name ?? "")")
                    if let travelTime {
                        Text(travelTime)
                    }
                }
                .font(.caption)
                .foregroundStyle(.white)
                .padding (10)
            }
            .onAppear {
                getLookAroundScene()
            }
            .onChange(of: selectedResult) {
                getLookAroundScene()
            }
        
    }

    // 주변보기 이미지를 표시하는 기능
    func getLookAroundScene () {
           lookAroundScene = nil
           Task {
               // 지도항목의 Scene을 요청
               let request = MKLookAroundSceneRequest(mapItem: selectedResult)
               lookAroundScene = try? await request.scene
           }
       }

}
