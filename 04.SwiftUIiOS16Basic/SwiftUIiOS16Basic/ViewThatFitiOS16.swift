//
//  ViewThatFitiOS16.swift
//  SwiftUIiOS16Basic
//
//  Created by 정정욱 on 11/28/23.

import SwiftUI

struct ViewThatFitiOS16: View {
    var body: some View {
        VStack (spacing: 20) {
            Text("1. ViewThatFit Horizontal")
                .font(.title.bold())
                .foregroundStyle(.blue)
            
            // View 의 사이즈를 측정해서 in .horizontal 방향으로 측정하기
            // 아이폰 스크린 사이즈에 맞춰서 측정함 Width 값이 700임으로 그거보다 작은 경우에는 그다음 도형을 자동으로 선택함
            ViewThatFits(in: .horizontal) { // 현제 가로 방향을 측정
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(.pink.opacity(0.7))
                    .overlay {
                        Text("가로모드 LandScape")
                    }
                    .frame(width: 700, height: 75) // 700보다 작으면 아래 코드 실행
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.orange.opacity(0.7))
                    .overlay {
                        Text("세로모드 Portrait")
                    }
                    .frame(width: 350, height: 75)
                
            }
        }
        .font(.title)
        .padding()
    }
}


struct ViewThatFitVertical: View {
    var body: some View {
        VStack (spacing: 20) {
            Text("2. ViewThatFit Vertical")
                .font(.title.bold())
                .foregroundStyle(.blue)
            
            ViewThatFits(in: .vertical) { // 수직 방향을 측정
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(.purple.opacity(0.7))
                    .overlay {
                        Text("세로모드 Portrait")
                    }
                    .frame(width: 200, height: 500) // 500보다 작으면 아래 실행
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.blue.opacity(0.7))
                    .overlay {
                        Text("가로모드 Landscape")
                    }
                    .frame(width: 400, height: 100)
                
            }
        }
        .font(.title)
        .padding()
    }
}

struct ViewThatFitPractice: View {
    /*
     실제 어플 환경에서 ViewThatFit을 사용하게 되면  설정한 범위 vertical 방향 만큼 설정이 안됐는데 그것이 넘어가게 되면 즉 스크린 사이즈 넘어가게 되면 다음 오브젝트로 넘어가서 스크롤 뷰가 적용이 되게끔 이런 식으로 ViewThatFit을 응용해서 사용할 수 있게 됩니다
     */
    @State var count: Int = 1
    
    
    var body: some View {
        VStack (spacing: 20) {
            Text("연습")
                .font(.largeTitle.bold())
                .foregroundStyle(.blue)
            
            ViewThatFits(in: .vertical) {
                // Vertical 방향으로 사이즈를 계산한 다음에 페이지 안넘가면 첫번째 적용
                VStack (spacing: 10) {
                    ForEach(1...count, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.red)
                            .frame(height: 200)
                    }
                }
                
                // ViewThatFit 안에 스크린 밖으로 넘어가면 ScrollView 각 적용되게 함
                ScrollView {
                    VStack (spacing: 10) {
                        ForEach(1...count, id: \.self) { index in
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.red)
                                .frame(height: 200)
                        }
                    }
                }
                
            }
            .onTapGesture {
                count += 1
            }
            
            
            Spacer()
        }
        .font(.title)
        .padding()
    }
}


#Preview("Horizontal") {
    ViewThatFitiOS16()
}

#Preview("Vertical") {
    ViewThatFitVertical()
}

#Preview("Practice") {
    ViewThatFitPractice()
}
