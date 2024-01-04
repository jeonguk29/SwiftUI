//
//  ContentView.swift
//  StartWidget
//
//  Created by 정정욱 on 1/3/24.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    // 그룹은 같은 앱과 익스텐션을 묶어주는 것임
    @State private var count: Int = (UserDefaults(suiteName: "group.com.woogie.StartWidget")?
        .integer(forKey: "coffee") ?? 0) // 불러오고
    
    var body: some View {
        VStack {
            Text("Drink \(count)")
            Text("Cups of coffee")
            Text("☕️")
            
            Button {
                count += 1
                UserDefaults(suiteName: "group.com.woogie.StartWidget")?.set(count, forKey: "coffee") // 저장하기
                
                print("count: \(count)")
                // 버튼이 눌릴때 위젯이 업데이트 되도록 해줘야함
                WidgetCenter.shared.reloadTimelines(ofKind: "MyWidget")
                
                /* MyWidget.swift에 있는 kind 변수의 문자열을 넣어주면 됨
                 struct MyWidget: Widget {
                 let kind: String = "MyWidget"
                 
                 버튼을 누를때마다 타임라인을 리로드하여 위젯이 리로드 되도록 함
                 */
            } label: {
                Text("Drink")
            }
            
        }
    }
}

#Preview {
    ContentView()
}
