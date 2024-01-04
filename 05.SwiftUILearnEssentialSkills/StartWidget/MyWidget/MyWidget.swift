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
            Text("Cups of coffee")
            Text("☕️")
        }
        //.containerBackground(.fill.tertiary, for: .widget)
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
    SimpleEntry(date: .now, count: 3)
}
