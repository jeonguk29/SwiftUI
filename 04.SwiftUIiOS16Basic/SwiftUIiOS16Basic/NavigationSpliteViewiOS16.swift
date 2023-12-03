//
//  NavigationSpliteViewiOS16.swift
//  SwiftUIiOS16Basic
//
//  Created by 정정욱 on 12/2/23.


import SwiftUI

struct NavigationSpliteViewiOS16: View {
    var body: some View {
        NavigationSplitView {
            // iPhone 일때는 Detail 화면이 나타나지 않음
            // Sidbar
            Text("Sidebar")
                .navigationTitle("NavigationSpliteView")
        } detail: { // Detail
            // iPad 일경우에만 Detail 부분 나옴
            Text("Detail")
        }
        
    }
}

struct NavigationSpliteViewVisibilty: View {
    
    @State private var visibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            // SideBar
            Text("SideBar")
        } detail: {
            Text("Detail")
            Button("Show SideBar") {
                visibility = .all
                // Visibility를 활용하면 디테일 뷰에서도 사이드 바를 호출 할 수 있음
            }
        }
        
    }
}


struct NavigationSpliteViewThree: View {
    
    @State private var visibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) { // 이렇게 하면 기본적으로 3개의 뷰가 다 나오는 것을 알 수 있음
            // SidBar
            Text("SideBar")
                .navigationSplitViewColumnWidth(120)
        } content: {
            // 중간에 Content
            Text("Content")
                .navigationSplitViewColumnWidth(min: 900, ideal: 1000)
        } detail: {
            // 마지막 Detail
            Text("Detail")
                .frame(width: 200)
                .navigationSplitViewColumnWidth(200)
        }
        // .automatic: Width 설정 한 값에 크기 맞추기
        // .balanced: SideBar와 Content 가 보이게 되면 Detail 부분이 줄어듬
        // .prominentDetail: Detail 부분이 main 에 위치하게 됨
        .navigationSplitViewStyle(.prominentDetail)
        
    }
}
/*
 navigationSplitView는 내비게이션 스택과 마찬가지로 iOS16에서 지원을 하게 되는데 아이패드 레이아웃을 지원할 때 컬럼으로 많이 나누는데 그럴 때 내비게이션 스플릿 뷰를 사용해서 뷰를 잘 쪼개서
 사용할 수 있다는 장점이 있습니다
 */
#Preview("Intro") {
    NavigationSpliteViewiOS16()
}

#Preview("NavigationSpliteViewVisibilty") {
    NavigationSpliteViewVisibilty()
}

#Preview("NavigationSpliteViewThree") {
    NavigationSpliteViewThree()
}

