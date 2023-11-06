//
//  CustomSheetBasic.swift
//  SwiftUIiOS16Basic
//
//  Created by Jacob Ko on 2022/12/09.
//

import SwiftUI

struct CustomSheetBasic: View {
	@State var showSheet: Bool = false
	
    var body: some View {
		Button {
			showSheet.toggle()
		} label: {
			Text("Sheet 보이기")
				.font(.title)
		}
		.sheet(isPresented: $showSheet) {
			Text("Custom Size Sheet 입니다")
			// iOS 16 Custom Size
            // 처음 small
				.presentationDetents([.small, .medium, .large])
				.presentationDragIndicator(.hidden) // sheet 맨위 상단 사각형 지우기
		}

    }
}

// Sheet Size 더 작게 Custom
extension PresentationDetent {
	static let small = Self.height(100)
}


struct CustomSheetBasic_Previews: PreviewProvider {
    static var previews: some View {
        CustomSheetBasic()
    }
}
