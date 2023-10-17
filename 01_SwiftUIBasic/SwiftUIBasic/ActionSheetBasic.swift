//
//  ActionSheetBasic.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/08/20.
//

import SwiftUI

struct ActionSheetBasic: View {
    // Alert과 비슷하지만 더 많은 커스터마이징이 가능함
	
	// property
	@State var showActionSheet: Bool = false
	@State var resultActionSheet: String = ""
	
    var body: some View {
		VStack {
			// show result
			Text(resultActionSheet)
				.font(.largeTitle)
			
			Spacer()
			
			// content
			
			HStack {
				Circle()
					.frame(width: 30, height: 30)
				
				Text("Jacob Ko")
				
				Spacer()
				
				Button {
					// action
					showActionSheet.toggle()
				} label: {
					Image(systemName: "ellipsis")
				}
			} // : HStack
			.padding(.horizontal)
			
			Rectangle()
				.aspectRatio(1, contentMode: .fit) // 너비가 비율에 따라 바뀌게 설정 현제 1:1로 설정 즉 비율에 따라 도형을 설정가능
			
			Spacer()
		} // : VStack
		.actionSheet(isPresented: $showActionSheet) {
			// actionSheet 담기는 내용 ActionSheet type
			getActionSheet()
		}
    } // :Body
	
	// function
	func getActionSheet() -> ActionSheet {
		let shareButton: ActionSheet.Button = .default(Text("공유하기")) {
			// action
			resultActionSheet = "공유 되었습니다"
		}
		let reportButton: ActionSheet.Button = .default(Text("신고하기")) {
			resultActionSheet = "신고 되었습니다"
		}
		let deleteButton: ActionSheet.Button = .destructive(Text("삭제")) {
			resultActionSheet = "삭제 되었습니다"
		}
		let cancelButton: ActionSheet.Button = .cancel()
		
		return ActionSheet(
			title: Text("ActionSheet 제목"),
			message: Text("ActionSheet 내용"),
			buttons: [shareButton, reportButton, deleteButton, cancelButton])
	}
}

struct ActionSheetBasic_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetBasic()
    }
}
