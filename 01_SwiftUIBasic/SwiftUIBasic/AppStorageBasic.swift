//
//  AppStorageBasic.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/11/17.
//

import SwiftUI

struct AppStorageBasic: View {
	
	// property
	// 일반적인 Data
	@State var generalName: String? // 앱 다시열때 값 저장 되어있지 않음
	
	// App Storage 을 사용하면 앱을 다시 열때 자동으로 키에서 이름을 가져옵니다
	@AppStorage("name") var appStrageName: String?
	
    var body: some View {
		VStack (spacing: 20) {
			// 일반적인 State
			VStack (spacing: 10){
				Text("@State 로 저장")
					.font(.headline)
				
				Text(generalName ?? "당신의 이름은 무었인가요?")
				
				Button {
					generalName = "Jacob"
				} label: {
					Text("이름 불러오기")
				}

			} //: VSTACK
			.padding()
			.border(.green)
			
			// @AppStorage 사용
			VStack (spacing: 10){
				Text("@AppStorage 로 저장")
					.font(.headline)
				
				Text(appStrageName ?? "당신의 이름은 무었인가요?")
				
				Button {
					appStrageName = "Jacob"
				} label: {
					Text("이름 불러오기")
				}
			} //: VSTACK
			.padding()
			.border(.red)
			
		} //: VSTACK
    }
}

struct AppStorageBasic_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageBasic()
    }
}
