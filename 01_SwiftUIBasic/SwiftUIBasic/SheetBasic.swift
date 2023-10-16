//
//  SheetBasic.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/08/18.
//

import SwiftUI

struct SheetBasic: View {
	// property
	@State var showSheet: Bool = false
	
    var body: some View {
		ZStack {
			// Background
			Color.green.ignoresSafeArea()
			
			// Content
			Button {
				showSheet.toggle()
			} label: {
				Text("Button")
					.foregroundColor(.green)
					.font(.headline)
					.padding()
					.background(Color.white)
					.cornerRadius(10)
			}
//			 .sheet(isPresented: $showSheet) {
//                 SheetBasic2() // 90% 위로 올라오게 구현 완료 화면 내릴 수 있음
//			 }
			.fullScreenCover(isPresented: $showSheet) {
				SheetBasic2()
			}
            // isPresented sheet이 보이질때와 넘길값
		}
    }
}

struct SheetBasic_Previews: PreviewProvider {
    static var previews: some View {
        SheetBasic()
    }
}
