//
//  GaugeViewBasic.swift
//  SwiftUIiOS16Basic
//
//  Created by Jacob Ko on 2022/12/09.
//

import SwiftUI

struct GaugeViewBasic: View {
	
	let gradient = Gradient(colors: [.green, .yellow, .orange, .red])
	
	var body: some View {
		Gauge(value: 0.4 , label: {
			//			Text("40퍼센트 나타내기")
		}, currentValueLabel: {
			Text("40%")
				.font(.caption)
		}) //: GAUGE
        .gaugeStyle(.accessoryLinear)
		.tint(gradient)
		.padding()
	}
}

struct GaugeViewBasic_Previews: PreviewProvider {
	static var previews: some View {
		GaugeViewBasic()
	}
}
