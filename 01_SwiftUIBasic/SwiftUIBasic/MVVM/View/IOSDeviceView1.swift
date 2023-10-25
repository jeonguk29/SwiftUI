//
//  IOSDeviceView1.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/11/17.
//

import SwiftUI

struct IOSDeviceView1: View {
	
	// 처음 ViewModel 을 초기화 할때는 @StateObject 로 불러오기!
	@StateObject var viewModel: IOSDeviceViewModel = IOSDeviceViewModel()
	// View가 ViewModel을 가짐
	
    var body: some View {
		NavigationView {
			List {
				ForEach(viewModel.iOSDeviceArray) { item in
					NavigationLink {
						// destination
						IOSDeviceView2(selectedItem: item.name)
					} label: {
						Text(item.name)
					} //: LINK
				} //: LOOP
			} //: LIST
		} //: NAVIGATION
		// Navigation 하위 뷰에 ViewModel 을 environmentObject 로 넘겨줌
		.environmentObject(viewModel) // ⭐️ 이렇게 넘겨줘야 @StateObject로 선언한 viewModel을 각각 연결된 하위뷰에 자유롭게 접근 하도록 할 수 있음
        // 네비게이션 뷰 사용시 environmentObject를 정말 많이 사용함 네비게이션 뷰는 정말 많은 서브뷰들이 있는데 일일히 바인딩 하기 힘들기 때문임
    }
}

struct IOSDeviceView1_Previews: PreviewProvider {
    static var previews: some View {
        IOSDeviceView1()
    }
}
