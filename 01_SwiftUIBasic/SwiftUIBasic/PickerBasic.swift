//
//  PickerBasic.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/08/30.
//

import SwiftUI

struct PickerBasic: View {
	// property
	let typeOfPhone : [String] = [
		"애플", "삼성", "샤오미", "기타 브랜드"
	]
	
	@State var selectedIndex: Int = 0
	
    var body: some View {
		NavigationView {
			Form {
				Section {
					Picker(selection: $selectedIndex, label: Text("기종 선택")) {
						ForEach(0 ..< typeOfPhone.count, id: \.self) { index in
                            Text(typeOfPhone[index]) // 배열의 원소만큼 반복
						} // : Loop
					} // :Picker
					.pickerStyle(.segmented)
				} // : Section
				
				Text("핸드폰 제조사는 \(typeOfPhone[selectedIndex]) 입니다") // 선택한 값 보여지도록
					.padding()
					.foregroundColor(.white)
					.background(Color.blue)
					.font(.headline)
					.padding()
					.frame(maxWidth: .infinity, alignment: .center)
				
			} // : From
			.navigationTitle(Text("현재 사용중인 핸드폰 기종은?"))
			.navigationBarTitleDisplayMode(.inline)
		} // : Navigation
    }
}

struct PickerBasic_Previews: PreviewProvider {
    static var previews: some View {
        PickerBasic()
    }
}
