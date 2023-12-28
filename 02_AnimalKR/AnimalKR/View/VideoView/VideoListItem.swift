//
//  VideoListItem.swift
//  AnimalKR
//
//  Created by Jacob Ko on 2022/12/26.
//

import SwiftUI

struct VideoListItem: View {
	
	// property
	let video: Video
	
    var body: some View {
		HStack (spacing: 10) {
			ZStack {
				Image(video.id)
					.resizable()
					.scaledToFill()
					.frame(width: 120, height: 90)
					.cornerRadius(10)
				
				
				Image(systemName: "play.circle")
					.resizable()
					.scaledToFit()
					.frame(height: 32)
					.shadow(radius: 5)
			} //: ZSTACK
			
			
			VStack (spacing: 10) {
				Text(video.name)
					.font(.largeTitle)
					.fontWeight(.heavy)
					.foregroundColor(.accentColor)
					.hLeading() // 수평의 앞쪽으로 땡기기
				
				Text(video.headline)
					.font(.footnote)
					.multilineTextAlignment(.leading)
					.lineLimit(2)
			} //: VSTACK
			
		} //: HSTACK
    }
}

struct VideoListItem_Previews: PreviewProvider {
    static var previews: some View {
		VideoListItem(video: Video.sampleVideoData)
    }
}
