//
//  MyWidget.swift
//  MyWidget
//
//  Created by 정정욱 on 1/3/24.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    // 기본 값을 채워주는 함수 (우리 위젯은 이렇게 생겼어)
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), count: 0)
    }

    // 스냅샷을 가져오는 함수
    // 스냅샷은 위젯이 실제로 표시되기 전에 사용자에게 미리 보여지는 이미지입니다. 이렇게 생성된 스냅샷은 위젯이 표시될 때 사용됩니다.
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), count: 0)
        completion(entry)
    }

    // ⭐️ 위젯의 업데이트 주기, 정책 설정 함수
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // 한 시간 간격으로 위젯을 자동 없데이트
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            
         
            // 앱에서 카운트 누른걸 가져와 적용
            let cupsOfCoffee = UserDefaults(suiteName: "group.com.woogie.StartWidget")! // 불러오고
                .integer(forKey: "coffee")
            
            // 위젯에 반영이 정확하게 되고 있는지 확인
            print("cupsOfCoffee: \(cupsOfCoffee)")
            let entry = SimpleEntry(date: entryDate, count: cupsOfCoffee)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}


// 위젯을 그리는데 필요한 (모델 시간, 데이터)
struct SimpleEntry: TimelineEntry {
    let date: Date
    let count: Int
}


// 이름만 EntryView임 SwiftUI 그냥 View와 같음 위젯의 화면을 그리는 부분
struct MyWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Drink \(entry.count)")
                .id(entry.count)
                .transition(.push(from: .trailing)) // 애니메이션 설정 부분
//                .animation(.smooth(duration: 0.5), value: entry.count)
                .animation(.bouncy(extraBounce: 0.5), value: entry.count)
            // 달력 넘어가듯이
            // 해당 텍스트만 변하게 구현
            Text("Cups of coffee")
            Text("☕️")
            
            Spacer()
            
            Text(entry.date, style: .date)
                .id(entry.count)
                .transition(.push(from: .bottom))
                .animation(.smooth(duration: 0.5), value: entry.count)
        }
        .containerBackground(.fill.tertiary, for: .widget)
    }
}

struct MyWidget: Widget {
    let kind: String = "MyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                MyWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                MyWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium]) // 위젯 크기를 설정에서 조절할 수 있도록
    }
}

#Preview(as: .systemSmall) {
    MyWidget()
} timeline: {
    SimpleEntry(date: .now, count: 0)
    SimpleEntry(date: Date(timeIntervalSince1970: 3), count: 3)
    // 기존에 SwiftUI View같은 경우는 State같은게 변하면 뷰가 변화했는데 Widget은
    SimpleEntry(date: Date(timeIntervalSince1970: 100), count: 6)
// 와 같이 타임라인이 변할때 바뀌는 값만 화면이 변함
}
