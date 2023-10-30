//
//  ObservableDemoView.swift
//  SwiftUIBasic
//
//  Created by 정정욱 on 10/26/23.
//

import SwiftUI
import Foundation // timer 돌릴려면 있어야함

class TimerData: ObservableObject {
    
    // ObservableObject 채택해서 timeCount 이 값 공유 해서 사용하겠다고 @Published를 사용
    @Published var timeCount = 0
    var timer: Timer?
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(timerDidFire),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func timerDidFire() {
        timeCount += 1
    }
    
    func resetCount(){
        timeCount = 0
    }
    
}


struct ObservableDemoView: View{
    @StateObject var timerData: TimerData = TimerData()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("시간 카운터 = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Button("시간 초기화"){
                    timerData.resetCount()
                }
                
                NavigationLink(
                    destination: ObservableSecondView(timerData: timerData),
                    label: {
                        Text("Next Screen")
                    })
                .padding()
                
            }
        }
        
    }
}

#Preview {
    ObservableDemoView()
}
