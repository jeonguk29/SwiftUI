//
//  DetailHead.swift
//  AnimalKR
//
//  Created by Jacob Ko on 2022/12/24.
//

import SwiftUI

// 재사용성을 위한 코드 컴포넌트 화 
struct DetailHead: View {
	
	// property
	var headingImage: String
	var headingText: String
	
    var body: some View {
		HStack {
			Image(systemName: headingImage)
				.foregroundColor(.accentColor)
				.imageScale(.large)
			
			Text(headingText)
				.font(.title)
				.fontWeight(.bold)
		} //: HSTACK
    }
}

struct DetailHead_Previews: PreviewProvider {
    static var previews: some View {
		DetailHead(headingImage: "gear", headingText: "Head Title")
    }
}
