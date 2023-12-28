//
//  VideoPlayerView.swift
//  AnimalKR
//
//  Created by Jacob Ko on 2022/12/26.
//

import SwiftUI

struct VideoPlayerView: View {
	
	let video: Video
	
    var body: some View {
		NavigationView {
			VStack {
				YoutubeView(videoID: video.videoid)
			}  //: VSTACK
			.navigationBarTitle("\(video.name)", displayMode: .inline)
		} //: NAVIGATION
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
		VideoPlayerView(video: Video.sampleVideoData)
    }
}
