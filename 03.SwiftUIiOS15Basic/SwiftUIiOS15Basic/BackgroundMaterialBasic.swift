//
//  BackgroundMaterialBasic.swift
//  SwiftUIiOS15Basic
//
//  Created by Jacob Ko on 2022/11/23.
//

import SwiftUI

struct BackgroundMaterialBasic: View {
	
	// property
	let url = URL(string: "https://picsum.photos/1000")
	
	var body: some View {
		
		VStack {
			Spacer()
			
			VStack {
				RoundedRectangle(cornerRadius: 4)
					.frame(width: 50, height: 4)
					.padding()
				
				Spacer()
				Text("Mateiral Background 예시")
					.font(.headline)
				
				Spacer()
			} //: VSTACK
			.frame(height: 350)
			.frame(maxWidth: .infinity)
			.background(.ultraThinMaterial) //ultraThinMaterial 제일 자연 스러움 
		} //: VSTACK
		.background(
			AsyncImage(url: url) { Image in
				Image
			} placeholder: {
				ProgressView()
			}
			
			
		)
		
		
		
		
	}
}

struct BackgroundMaterialBasic_Previews: PreviewProvider {
	static var previews: some View {
		BackgroundMaterialBasic()
	}
}
