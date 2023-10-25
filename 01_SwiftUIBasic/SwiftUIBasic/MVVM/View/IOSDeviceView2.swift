//
//  IOSDeviceView2.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/11/17.
//

import SwiftUI

struct IOSDeviceView2: View {
	
	// property
	let selectedItem: String
	
	
    var body: some View {
		ZStack {
			// background
			Color.orange.ignoresSafeArea()
			
			VStack (spacing: 20) {
				Text("당신이 선택한 기기는?")
					.font(.title)
				
				Text(selectedItem)
					.font(.headline)
					.foregroundColor(.orange)
					.padding()
					.padding(.horizontal)
					.background(Color.white)
					.cornerRadius(20)
				
				NavigationLink {
					IOSDeviceView3()
				} label: {
					Text("다음 페이지로 이동 -> ")
						.font(.headline)
						.foregroundColor(.orange)
						.padding()
						.padding(.horizontal)
						.background(Color.white)
						.cornerRadius(20)
				}

			} //: VSTACK
		} //:ZSTACK
    }
}

struct IOSDeviceView2_Previews: PreviewProvider {
    static var previews: some View {
		IOSDeviceView2(selectedItem: "아이폰")
    }
}
