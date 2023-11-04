//
//  AsyncImageBasic.swift
//  SwiftUIiOS15Basic
//
//  Created by Jacob Ko on 2022/11/23.
//

import SwiftUI

/*
 https://picsum.photos/
 랜덤 이미지를 가져오는 사이트
 */
struct AsyncImageBasic: View {
	
	// property
	let url = URL(string: "https://picsum.photos/200")
	
    var body: some View {
		VStack (spacing: 20) {
			// 일반적인 AsynImage 사용 with ProgressView()
			Text("1. 일반적인 AsyncImage 사용 예시")
				.font(.headline)
			
			AsyncImage(url: url) { Image in
				Image
					.resizable()
					.scaledToFit()
					.frame(width: 200, height: 200)
					.cornerRadius(20)
			} placeholder: {
				ProgressView() // 이미지를 보여주기전 셋팅 화면
			}
			
			Divider()

			// switch 을 통한 Image error
			
			/*
             ⭐️ 이처럼 error 처리 해주는게 가장 좋음
             
			 switch case
			 case empty -> Image 없음
			 case success -> Image 로드 성공
			 case failure -> Image 로드 실패 with error
			 */
			Text("2. Switch 을 통한 Image error 처리")
				.font(.headline)
			
			AsyncImage(url: url) { raw in
				switch raw {
				case .empty:
					ProgressView()
					
				case .success(let image):
					image
						.resizable()
						.scaledToFit()
						.frame(width: 200, height: 200)
						.cornerRadius(20)
					
				case .failure:
					Text("Image 가 로드 되지 않음")
				default:
					Text("Image 가 로드 되지 않음")
				} //: SWITCH
			} //: ASYNCIMAGE
			
		} //: VSTACK
    }
}

struct AsyncImageBasic_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageBasic()
    }
}
