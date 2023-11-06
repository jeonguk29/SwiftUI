//
//  TabGruesturewithLocationBasic.swift
//  SwiftUIiOS16Basic
//
//  Created by Jacob Ko on 2022/12/09.
//

import SwiftUI

struct TabGruesturewithLocationBasic: View {
	
	@State var point: CGPoint = .init(x: 0.0, y: 0.0)
	
	@State var x: Double = 0.0
	@State var y: Double = 0.0
	
    var body: some View {
        
		VStack (spacing: 20) {
			
			HStack {
				Text("X좌표 : ")
				Text("\(x)")
			} //: HSTACK
			
			HStack {
				Text("Y좌표 : ")
				Text("\(y)")
			} //: HSTACK
			
			
			// Rectangle 범위내에서 위치 - Local
			Rectangle()
				.fill(.green)
				.frame(width: 300, height: 300)
				.padding()
            // 프레임 300, 300 범위 안에서만
				.onTapGesture { location in
					point = location
					convertToDouble(point: point)
				}
			
			// 전체 화면 내에서의 위치 - Global
			Rectangle()
				.fill(.blue)
				.frame(width: 300, height: 300)
				.padding()
            // 전체 화면 대비 이 사격형의 좌표를 알려줘 위랑 다르게 같은 곳을 눌러도 전체화면 기준이라 300을 넘음
				.onTapGesture(coordinateSpace: .global) { location in
					point = location
					convertToDouble(point: point)
				}
			
		} //: VSTACK
    }
	
	func convertToDouble(point: CGPoint) {
		x = Double(point.x)
		y = Double(point.y)
	}
	
}

struct TabGruesturewithLocationBasic_Previews: PreviewProvider {
    static var previews: some View {
        TabGruesturewithLocationBasic()
    }
}
