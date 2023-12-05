//
//  SectorMarkiOS17.swift
//  SwiftUIBasiciOS17
//
//  Created by Jacob Ko on 14/11/23.
//

import SwiftUI
import Charts
/*
 iOS 16 에서 차트가 새롭게 지원이 되면서 또 iOS 17 에서는 Sector Mark를 통해서 여러분들이 커스텀해서 파이차트, 도넛차트를 커스텀해서 만들 수 있습니다.
 */

// Model
struct SectorMarkData: Identifiable {
	let id = UUID() // ID 값을 주기위한 프로토콜 Identifiable를 채택해야 사용 가능
	let label: String
	let value: Int
	
	static func fetchData() -> [SectorMarkData] {
		[
			SectorMarkData(label: "제이콥", value: 35),
			SectorMarkData(label: "철수", value: 20),
			SectorMarkData(label: "영희", value: 20),
			SectorMarkData(label: "엠마", value: 25),
		]
	}
}



struct SectorMarkiOS17: View {
	private let records: [SectorMarkData] = SectorMarkData.fetchData()
	
	var body: some View {
		VStack {
			Chart(records) { data in
				// 1. 파이차트 만들기
				// .angle: 차트에서 나누는 기준값
				// .angularInset: 파이차트 안에서 나눠지는 구분선 넓이
				SectorMark(angle: .value("Record", data.value), angularInset: 4)
					.cornerRadius(10)
					.blur(radius: data.label == "제이콥" ? 5 : 0)
					.foregroundStyle(by: .value("Record Label", data.label))
                // 타입이 문자, 숫자에 따라 info가 다르게 보임
                // .foregroundStyle(by:)를 사용하여 레코드 레이블에 따라 차트의 스타일을 설정합니다.
				
			}
			.padding(.horizontal)
			
			Chart(records) { data in
				// 2. 도넛차트 만들기
				SectorMark(angle: .value("Record", data.value),
						   // innerRadius: 안의 도넛 크기 원형설정
						   innerRadius: MarkDimension.ratio(0.6),
						   // outerRadius: 도넛 바깥에 얼마나 padding 값을 주는지 설정
						   outerRadius: MarkDimension.inset(60))
				.foregroundStyle(by: .value("Record Label", data.value))
			}
		}
		.chartLegend(position: .bottom, alignment: .center, spacing: 10)// (chart info) 의 위치 및 간격을 조절
		.dynamicTypeSize(.accessibility2) // 차트의 각 컬러가(chart info) 무엇인지 표시해 주는 부분의 크기를 조절하게 할 수 있음
		.padding(.horizontal)
	}
}

#Preview("SectorMark") {
	SectorMarkiOS17()
}

/* value 부분은 무엇을 말하는가...
 `SectorMark`에서 `value: PlottableValue<D>`를 사용하는 이유는 차트에 표시할 값의 유형을 지정하고, 해당 값에 따라 차트를 그리거나 스타일을 지정하기 위함입니다. 이를 통해 다양한 데이터를 시각적으로 표현하고 분석할 수 있습니다.

 키-값 형식을 사용하는 이유는 다음과 같습니다:

 1. 데이터 분류: `value`를 통해 데이터를 분류하고, 이를 기준으로 차트를 그릴 수 있습니다. 예를 들어, "Record"라는 키를 사용하여 데이터를 분류하면, "Record" 값에 따라 차트를 그릴 수 있습니다. 이를 통해 데이터의 특성이나 카테고리에 따라 차트를 구분할 수 있습니다.

 2. 스타일 지정: `value`를 사용하여 스타일을 지정할 수 있습니다. 예를 들어, "Record Label"이라는 키를 사용하여 레코드 레이블에 따라 차트의 스타일을 다르게 지정할 수 있습니다. 이를 통해 차트의 시각적인 표현을 다양화하고, 데이터의 특성을 강조할 수 있습니다.

 또한, 키-값 형식은 데이터를 보다 구조적으로 관리할 수 있게 해주며, 데이터 간의 관계를 나타낼 수도 있습니다. 예를 들어, 여러 개의 `SectorMark`를 사용하여 다양한 키와 값으로 구성된 차트를 그릴 수 있습니다.

 따라서, `value: PlottableValue<D>`를 통해 키-값 형식을 활용하여 데이터를 분류하고, 차트를 그리거나 스타일을 지정할 수 있습니다. 필요에 따라 키와 값을 적절하게 선택하여 데이터를 다루고 시각화할 수 있습니다.
 */
