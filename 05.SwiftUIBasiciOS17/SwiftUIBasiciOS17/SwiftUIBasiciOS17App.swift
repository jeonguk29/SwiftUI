//
//  SwiftUIBasiciOS17App.swift
//  SwiftUIBasiciOS17
//
//  Created by Jacob Ko on 14/11/23.
//

import SwiftUI

@main
struct SwiftUIBasiciOS17App: App {
	
	// 기존에 ViewModel 에서 Environment 로 넘겨서 전체 APP 단위로 사용할 때 방식
	@StateObject private var vm1 = UserObservableObject()
	
	// iOS17 부터 변경된 사항
	@State private var vm2 = UserObservableMacro()
	
	
    var body: some Scene {
        WindowGroup {
			ObservationiOS17()
				.environmentObject(vm1) // 기존방식 : EnvironmentObject 로 넘겨줌
				.environment(vm2) // iOS 17 부터는 environment 로 그냥 넘김
        }
    }
}
