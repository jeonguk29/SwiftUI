//
//  ContentUnavailableViewiOS17.swift
//  SwiftUIBasiciOS17
//
//  Created by Jacob Ko on 16/11/23.
//

import SwiftUI

/*
앱에서 어떠한 에러로 뷰에 나타나지 못했을 때 유저에게 에러를 표시할 수 있는 뷰를 자동으로생성해 줄 수 있는 Content Unavailable 뷰 iOS 17부터 애플에서 기본적으로 제공하는 템플릿 양식에 라벨, 이미지 등만 넣어서 개발자가 따로 만들었던 뷰를
 제공 해주기 시작함
 */

struct ContentUnavailableViewiOS17: View {
	
	// Image 와 Text 를 함쳐서 전체 스크린에 나타냄 -> 말 그대로 Content 가 unavailable 즉 사용할 수 없는 상태 UUI 에 Error 표시 할 때 유용함
    var body: some View {
        ContentUnavailableView("BAD CONNECTION", systemImage: "wifi.exclamationmark", description: Text("인터넷이 연결되어 있지 않습니다."))
        // "wifi.exclamationmark" SF Symbols에서 가져다 사용 가능
        // 정보만 입력하면 알아서 만들어줌
		
		Divider()
		
		ContentUnavailableView(label: {
			Label("정말로 삭제하시겠습니까?", systemImage: "questionmark.circle.fill")
		}, description: {
			Text("아래 삭제 버튼을 누르면 영구 삭제 됩니다")
		}, actions: {
			HStack (spacing: 30) {
				Button("Cancel", role: .cancel) {
					// Cancel Action
				}
				Button("Delete", role: .destructive) {
					// Delete Action
				}
				.buttonStyle(.borderedProminent)
			}
			.fixedSize() // 버튼 이미지가 짤리는 것을 늘려서 보여주게 가능
			
		})
    }
}

// 아래와 같은 경우는 앱 처음시작할때 보여주는 랜딩 페이지 (앱이 어떻게 작동을 하는지)
struct ContentUnavaulablePaging: View {
	var body: some View {
		// TabView 을 이용해서 간단하게 page 형식으로도 만들 수 있습니다.
		
		TabView {
			ContentUnavailableView("SwiftUI", image: "mobile1", description: Text("SwiftUI 로 여러가지 App 을 만들 수 있습니다"))
			ContentUnavailableView("Sync", image: "mobile2", description: Text("아이폰과 아이패드를 iCloud 로 동기화 합니다"))
			ContentUnavailableView("Shopping APP", image: "mobile3", description: Text("온라인 쇼핑 APP 을 SwiftUI 로 만듭니다"))
		}
		.tabViewStyle(.page)
		.indexViewStyle(.page(backgroundDisplayMode: .always))
	}
}

#Preview("Intro") {
    ContentUnavailableViewiOS17()
}

#Preview("Paging") {
	ContentUnavaulablePaging()
}
