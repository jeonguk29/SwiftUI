//
//  MultiDatePickeriOS16.swift
//  SwiftUIiOS16Basic
//
//  Created by 정정욱 on 12/2/23.


import SwiftUI

struct MultiDatePickeriOS16: View {
    
    @State private var dates: Set<DateComponents> = []
    
    var body: some View {
        VStack (spacing: 10) {
            Text("Multi Date Picker")
                .font(.largeTitle.bold())
                .foregroundStyle(.blue)
            
            MultiDatePicker("Date Picker", selection: $dates)
                .frame(height: 400)
                .tint(.red)
            
            List {
                Section("선택된 날짜") {
                    // Set 타입이라 배열 타입으로 한번 묶어 줘야함
                    ForEach(Array(dates), id: \.self) { date in
                        Text("\(date.month!)월 \(date.day!)일")
                    }
                }
            }
            .font(.title)
            Spacer()
        }
    }
}

struct MultidatePickerSheet: View {
    
    @State private var dates: Set<DateComponents> = []
    @State private var showSheet: Bool = false
    
    // 날짜 빠른 순으로 정렬
    private var sortedDates: [String] {
        dates.sorted { date1, date2 in
            date1.date! < date2.date!
        }
        .map { date in
            "\(date.month!)월 \(date.day!)일" // 최종 배열에 저장될 값 형식
        }
    }
    
    
    var body: some View {
        VStack (spacing: 10) {
            Text("MultiDatePicker with Sheet")
                .font(.title.bold())
                .foregroundStyle(.blue)
            
            Button("달력 오픈") {
                showSheet.toggle()
            }
            .buttonStyle(.borderedProminent)
            
            List {
                Section("선택된 날짜") {
                    ForEach(sortedDates, id: \.self) { date in
                        Text(date)
                    }
                }
            }
            
            Spacer()
        }
        .font(.title)
        .sheet(isPresented: $showSheet, content: {
            VStack {
                MultiDatePicker("Sheet", selection: $dates)
                
                Button("Done") {
                    showSheet.toggle()
                }
                .buttonStyle(.borderedProminent)
            }
            .presentationDetents([.medium]) //sheet 올라오는 크기를 설정
        })
    }
}

#Preview("Intro") {
    MultiDatePickeriOS16()
}

#Preview("with Sheet") {
    MultidatePickerSheet()
}
