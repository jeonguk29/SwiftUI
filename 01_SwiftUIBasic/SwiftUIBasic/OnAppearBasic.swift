//
//  OnAppearBasic.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/11/01.
//

import SwiftUI

// OnAppear : 뷰가 나타낼때 자동으로 실행되는 이벤트를 처리할때
/*
 만약 인터넷으로 데이터 정보를 가지고 오는데 앱 시작과 동시에
 가져올 수 있지만 그 양이 많아, 한 번에 많은 양을 가져올 때
 로드로 인한 앱이 정지되는 상황이 될 수도 있습니다.
 이때 onAppear를 사용해서 특정 뷰가 화면에 나타날 때 데이터를 패치하는 이벤트를 처리 할수 있음 (한번의 로드 되는 것을 방지)
 */
struct OnAppearBasic: View {
	// property
	@State var noticeText: String = "onAppear 시작전"
	@State var count: Int = 0
	
    var body: some View {
		NavigationView {
			ScrollView {
				Text(noticeText)
				
				// 화면이 보이고 나서 load 가 되게끔 하는 LazyStack
				LazyVStack {
					// 50 개의 직사각형 박스 만들기
					ForEach(0..<50) { _ in
						RoundedRectangle(cornerRadius: 25.0)
							.frame(height: 200)
							.padding()
						// onAppear: 새로 화면에 생길때 마다 count 1씩 증가 시키기
							.onAppear {
								count += 1
							}
					} //: LOOP
				} //: LAZYVSTACK
			}//: SCROLL
            
            
			// .opAppear: 여기선 onAppearBasic View 가 화면에 나타날때 시작되는 logic 넣기
			.onAppear {
				// dispatchQueue 을 사용해서 main thread 에 2초 딜레이 후 이벤트 실행
				DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
					noticeText = "onAppear 시작 완료 했습니다"
				}
			}
			.navigationTitle("생성된 박스 : \(count)")
		} //: NAVIGATION
    }
}

struct OnAppearBasic_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearBasic()
    }
}
