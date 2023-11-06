//
//  ShareLinkBasic.swift
//  SwiftUIiOS16Basic
//
//  Created by Jacob Ko on 2022/12/09.
//

import SwiftUI

// ShareLink를 사용해 보다 쉽게 공유 기능 사용 가능
struct ShareLinkBasic: View {
	let natureImage = ImageFile(image: Image("nature"))
	
    var body: some View {
		VStack (spacing: 20) {
			// URL ShareLink
			ShareLink(item: URL(string: "https://github.com/jeonguk29")!) {
				Text("링크 Share")
					.font(.largeTitle)
			}
			
			// Image ShareLink
			ShareLink(item: natureImage, preview: SharePreview("Nature 사진", image: natureImage.image)) { // SharePreview 는 이미지 작게 표시
				Text("이미지 Share")
					.font(.largeTitle)
			}
		}
    }
}

struct ShareLinkBasic_Previews: PreviewProvider {
    static var previews: some View {
        ShareLinkBasic()
    }
}

// Image ShareLink를 사용하기 위해
struct ImageFile: Transferable {
	var image: Image
	static var transferRepresentation: some TransferRepresentation {
		ProxyRepresentation(exporting: \.image)
	}
}
