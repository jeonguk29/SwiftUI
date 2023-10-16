//
//  SheetBasic2.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/08/18.
//

import SwiftUI

struct SheetBasic2: View {
	
	// property
	@Environment(\.presentationMode) var presentaionMode
	// 넘겨주는 화면에서 값을 받을 수 있음
    
    var body: some View {
		ZStack(alignment: .topLeading) {
			
			// background
			Color.red.ignoresSafeArea()
			
			// contents
			Button {
				// Sheet 닫기 action
				presentaionMode.wrappedValue.dismiss()
			} label: {
				Image(systemName: "xmark")
					.foregroundColor(.white)
					.font(.largeTitle)
					.padding()
			}

		}
    }
}

struct SheetBasic2_Previews: PreviewProvider {
    static var previews: some View {
        SheetBasic2()
    }
}
