//
//  HomeView.swift
//  AnimalKR
//
//  Created by Jacob Ko on 2022/12/23.
//

import SwiftUI

struct HomeView: View {
	
	// property
	@StateObject var vm: AnimalViewModel = AnimalViewModel()
	
    var body: some View {
		TabView {
			// 1. ContentView
			ContentView(vm: vm)
				.tabItem {
					Image(systemName: "house.fill")
					Text("홈")
				}
			
			// 2. VideoView
			VideoView(vm: vm)
				.tabItem {
					Image(systemName: "play.rectangle")
					Text("비디오")
				}
			
			// 3. GarallyView
			GallaryView(vm: vm)
				.tabItem {
					Image(systemName: "photo")
					Text("갤러리")
				}
			
			// 4. AppInfoView
			AppInfoView()
				.tabItem {
					Image(systemName: "gear")
					Text("앱정보")
				}
			
		} //: TAB
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
