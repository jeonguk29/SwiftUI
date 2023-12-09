//
//  SectorMarkiOS17.swift
//  SwiftUIBasiciOS17
//
//  Created by Jacob Ko on 14/11/23.
//

import SwiftUI
import Charts
/*
 iOS 16 에서 차트가 새롭게 지원이 되면서 또 iOS 17 에서는 Sector Mark를 통해서 파이차트, 도넛차트를 커스텀해서 만들 수 있습니다.
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


/* 
 `SectorMark`는 SwiftUI의 차트 뷰(Chart View) 중 하나로, 파이 차트와 도넛 차트를 커스터마이즈할 수 있는 뷰입니다. 파이 차트는 원형으로 나뉘어진 부분을 각각의 섹터(Sector)로 표현하는 차트이고, 도넛 차트는 파이 차트의 내부에 구멍이 뚫려 있는 형태의 차트입니다.

 `SectorMark`를 사용하여 파이 차트와 도넛 차트를 만들 때, 각 섹터의 크기와 스타일을 지정할 수 있습니다. 주요 속성과 기능은 다음과 같습니다:

 1. `angle`: 차트에서 각 섹터의 크기를 결정하는 기준값을 설정합니다. 일반적으로 데이터의 값을 사용하여 섹터의 크기를 조절합니다.

 2. `angularInset`: 파이 차트에서 섹터 간의 구분선을 나타내는데 사용되는 너비를 설정합니다. 구분선을 통해 각 섹터가 명확하게 구분됩니다.

 3. `innerRadius`: 도넛 차트에서 내부 원의 반지름을 설정합니다. 내부 원의 크기를 조절하여 도넛 차트의 두께를 조절할 수 있습니다.

 4. `outerRadius`: 도넛 차트에서 외부 원의 반지름을 설정합니다. 외부 원의 크기를 조절하여 도넛 차트의 전체 크기를 조절할 수 있습니다.

 5. `foregroundStyle(by:)`: 섹터의 스타일을 설정합니다. 이를 통해 각 섹터에 대한 색상, 투명도, 선 스타일 등을 지정할 수 있습니다. 이때, `by:` 뒤에는 특정 값을 기준으로 스타일을 지정할 수 있습니다.

 `SectorMark`를 사용하여 파이 차트와 도넛 차트를 만들면, 데이터를 시각적으로 표현하고 분석할 수 있습니다. 각 섹터의 크기와 스타일을 조절하여 데이터의 특성을 강조하거나 비교할 수 있습니다.

 요약하자면, `SectorMark`는 SwiftUI에서 파이 차트와 도넛 차트를 커스터마이즈할 수 있는 뷰입니다.
 
 
 
 
 value 부분은 무엇을 말하는가...
 `SectorMark`에서 `value: PlottableValue<D>`를 사용하는 이유는 차트에 표시할 값의 유형을 지정하고, 해당 값에 따라 차트를 그리거나 스타일을 지정하기 위함입니다. 이를 통해 다양한 데이터를 시각적으로 표현하고 분석할 수 있습니다.

 키-값 형식을 사용하는 이유는 다음과 같습니다:

 1. 데이터 분류: `value`를 통해 데이터를 분류하고, 이를 기준으로 차트를 그릴 수 있습니다. 예를 들어, "Record"라는 키를 사용하여 데이터를 분류하면, "Record" 값에 따라 차트를 그릴 수 있습니다. 이를 통해 데이터의 특성이나 카테고리에 따라 차트를 구분할 수 있습니다.

 2. 스타일 지정: `value`를 사용하여 스타일을 지정할 수 있습니다. 예를 들어, "Record Label"이라는 키를 사용하여 레코드 레이블에 따라 차트의 스타일을 다르게 지정할 수 있습니다. 이를 통해 차트의 시각적인 표현을 다양화하고, 데이터의 특성을 강조할 수 있습니다.

 또한, 키-값 형식은 데이터를 보다 구조적으로 관리할 수 있게 해주며, 데이터 간의 관계를 나타낼 수도 있습니다. 예를 들어, 여러 개의 `SectorMark`를 사용하여 다양한 키와 값으로 구성된 차트를 그릴 수 있습니다.

 따라서, `value: PlottableValue<D>`를 통해 키-값 형식을 활용하여 데이터를 분류하고, 차트를 그리거나 스타일을 지정할 수 있습니다. 필요에 따라 키와 값을 적절하게 선택하여 데이터를 다루고 시각화할 수 있습니다.
 */
