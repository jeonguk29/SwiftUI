//
//  VideoView.swift
//  AnimalKR
//
//  Created by Jacob Ko on 2022/12/23.
//

import SwiftUI

struct VideoView: View {
	
	// property
	@ObservedObject var vm: AnimalViewModel
	
    var body: some View {
		NavigationView {
			List {
				ForEach(vm.videos) { video in
					NavigationLink {
						// detination
						VideoPlayerView(video: video)
					} label: {
						VideoListItem(video: video)
					}

				}  //: LOOP
			} //: LIST
			.listStyle(.plain)
			.navigationBarTitle("비디오", displayMode: .inline)
		} //: NAVIGATION
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(vm: AnimalViewModel())
    }
}
