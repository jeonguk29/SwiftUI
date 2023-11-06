//
//  ChartBasic.swift
//  SwiftUIiOS16Basic
//
//  Created by Jacob Ko on 2022/12/08.
//

import SwiftUI
import Charts // 불러와야함

// MARK: Sample Model and Data
struct WeightModel: Identifiable {
	var id: String = UUID().uuidString
	var day: String
	var weight: Double
}

var weightData: [WeightModel] = [
	WeightModel(day: "Sun", weight: 77),
	WeightModel(day: "Mon", weight: 80),
	WeightModel(day: "Tue", weight: 90),
	WeightModel(day: "Wed", weight: 82),
	WeightModel(day: "Thu", weight: 70),
	WeightModel(day: "Fri", weight: 60),
	WeightModel(day: "Sat", weight: 88)
]


// MARK: VIEW

struct ChartBasic: View {
    var body: some View {
		
        // 2️⃣ custom 색 array
		let barColor: [Color] = [.red, .black, .blue, .green, .yellow, .purple, .teal]
		
		
		ScrollView {
			VStack (spacing: 20) {
				Text("1. 바형 차트")
				Chart(weightData) { item in
					BarMark(
                        // x, y 값으로 항상 키, 값 설정 필요
						x: .value("Day", item.day),
						y: .value("Weight", item.weight)
					)
					.foregroundStyle(by: .value("Day", item.day))
                    // ⭐️ bar 컬러 지정방법
                    // 1️⃣ 자동으로 컬러 지정 !!
                    
                    
                    // 각각 bar의 심볼 넣는 방법
					.annotation(position: .top) {
						Image(systemName: "square.and.arrow.down")
							.foregroundStyle(.red)
					}
				} //: CHART
                
                // 2️⃣ 지정 컬러 적용
				// cutomColor
				.chartForegroundStyleScale(
					domain: weightData.compactMap({ weight -> String in
						weight.day // 배열을 돌면서 day 값을 String으로 추출
					}),
					range: barColor
				)
				.frame(height: 200)
				
				Divider()
				
				Text("2. 라인 차트")
				Chart(weightData) { item in
					LineMark(
						x: .value("Day", item.day),
						y: .value("Weight", item.weight)
					)
                    
					//.lineStyle(StrokeStyle(lineWidth: 10)) // 라인 두께
					// .symbol(by: .value("Day", item.day)) // 각 요소에 알맞는 심볼 삽입
					// .interpolationMethod(.catmullRom) // 곡선 형태로 라인 그리기, 계단식 등 다양한 옵션 있음
					.interpolationMethod(.linear)
					
					// Line Mark 에 PointMark 를 같이 사용해서 simbol 을 주게 되면 같이 사용할 수 있게 됩니다
					PointMark(
						x: .value("Day", item.day),
						y: .value("Weight", item.weight)
					)
					.symbol(by: .value("Day", item.day))
					
				} //: CHART
				.frame(height: 200)
				
				Divider()
				
				Text("3. 사각형 차트")
				Chart(weightData) { item in
					RectangleMark(
						x: .value("Day", item.day),
						y: .value("Weight", item.weight)
					)
				} //: CHART
				.frame(height: 200)
				
			} //: VSTACK
			
			VStack (spacing: 20) {
				Divider()
				
				Text("4.범위 차트")
				Chart(weightData) { item in
					AreaMark(
						x: .value("Day", item.day),
						y: .value("Weight", item.weight)
					)
					.interpolationMethod(.catmullRom) // 곡선 형태로, 직선 등 다 가능
					
                    // Y 축 선 긋기
					RuleMark(
						y: .value("Mid", 75)
					)
					.foregroundStyle(.red)
					
				} //: CHART
				.frame(height: 200)
			}
			
		} //: SCROLL
		.padding()
    }
}

struct ChartBasic_Previews: PreviewProvider {
    static var previews: some View {
        ChartBasic()
    }
}
