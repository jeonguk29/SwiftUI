//
//  ContexMenuBasic.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/08/20.
//

import SwiftUI

struct ContexMenuBasic: View {
	
	// property
	@State var statusText: String = ""
	@State var background: Color = Color.blue
	
    var body: some View {
		VStack (spacing: 30) {
			
			Text(statusText)
			
			VStack(alignment: .leading, spacing: 10) {
				Text("Context Menu Test")
					.font(.headline)
				Text("이 버튼을 길게 누르면 메뉴가 나타납니다")
					.font(.subheadline)
			} // : VStack
			.foregroundColor(.white)
			.padding(30)
			.background(background)
			.cornerRadius(20)
			.contextMenu {  // contextMenu가 시작될때 어떤 버튼들을 위치시키고 처리할지 정의
				
				Button {
					statusText = "공유가 되었습니다"
					background = .yellow
				} label: {
					Label {
						// title
						Text("Share post")
					} icon: {
						Image(systemName: "square.and.arrow.up")
					}

				}
				
				Button {
					statusText = "신고가 되었습니다"
					background = .red
				} label: {
					Label {
						// title
						Text("Report post")
					} icon: {
						Image(systemName: "exclamationmark.bubble")
					}

				}
				
				Button {
					statusText = "좋아요 추가!"
					background = .green
				} label: {
					Label {
						// title
						Text("Like post")
					} icon: {
						Image(systemName: "hand.thumbsup")
					}

				}

			} // : ContextMenu
			
		} // :VStack
    }
}

struct ContexMenuBasic_Previews: PreviewProvider {
    static var previews: some View {
        ContexMenuBasic()
    }
}
