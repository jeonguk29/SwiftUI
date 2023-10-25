//
//  IOSDeviceView3.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/11/17.
//

import SwiftUI

struct IOSDeviceView3: View {
	
	// property
    // 최상위 View의 @StageObject로 지정해준 ViewModel 을 @EnvironmentOject 를 통해 가져오기
    // - 이렇게 사용하면 훨씬 편함 뷰 넘어갈때마다 값들을 다 넘겨서 Binding해서 일일이 넘겨주는게 아니라
	@EnvironmentObject var viewModel: IOSDeviceViewModel
	
    var body: some View {
		ZStack {
			//background
			Color.blue.ignoresSafeArea()
			
			ScrollView {
				VStack (spacing: 20) {
					ForEach(viewModel.iOSDeviceArray) { item in
						Text(item.name)
					} //: LOOP
				} //:VSATCK
				.foregroundColor(.white)
				.font(.largeTitle)
			} //: SCROLL
		} //: ZSTACK
    }
}

struct IOSDeviceView3_Previews: PreviewProvider {
    static var previews: some View {
        IOSDeviceView3()
			.environmentObject(IOSDeviceViewModel())
        // ⭐️ 이게 없으면 Environment Preview 에러남
        // Object가 Preview Device View Model 이라는 것을 이렇게 알려줘야함 프리뷰는 이 viewModel이 뭔지 몰라서 그럼 @EnvironmentObject 사용할때 꼭 프리뷰에 넣어주자
    }
}
