//
//  SecondNavigationView.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/08/19.
//

import SwiftUI

struct SecondNavigationView: View {
	
	// property
	@Environment(\.presentationMode) var presentationMode
	
	
    var body: some View {
		ZStack {
			// background
			Color.green.ignoresSafeArea()
			
			VStack (spacing: 20){
				Button {
					presentationMode.wrappedValue.dismiss()
				} label: {
					Text("이전 페이지로 이동")
						.foregroundColor(.green)
						.font(.headline)
						.padding()
						.background(Color.white)
						.cornerRadius(10)
				}
				
				NavigationLink {
					// destination
					ZStack { // 3번째 페이지에 어떤게 나타날지 바로 지정
						Color.red.ignoresSafeArea()
						Text("3번째 페이지 입니다")
							.font(.largeTitle)
					}
				} label: {
					Text("3번째 페이지로 이동")
						.foregroundColor(.green)
						.font(.headline)
						.padding()
						.background(Color.white)
						.cornerRadius(10)
				}

			}
			
		}
    }
}

struct SecondNavigationView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationView { // 프리뷰에서 확일할때 NavigationView로 감싸줘야함
			SecondNavigationView()
		}
    }
}
