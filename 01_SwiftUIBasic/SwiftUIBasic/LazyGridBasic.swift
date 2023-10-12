//
//  LazyGridBasic.swift
//  SwiftUIBasic
//
//  Created by 정정욱 on 2023/08/04.
//

import SwiftUI

struct LazyGridBasic: View {
    
    // LazyVGrid
    // columns의 갯수를 3개로 설정
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
        
    ]
    
    // LazyHGrid
    // title을 1000개 변수를 생성
    // ["목록 1", "목록 1", ...."목록 1000"] [String]
    let title: [String] = Array(1...1000).map{"목록 \($0)"}
    
    // 화면 그리드형식으로 채워줌
    // 컬럼 2개, 최대 사이즈 80으로 설정 (flexible은 유동적으로 조절함 작아지고 커질수도 있지만 최대는 80이라는 뜻 )
    let layout: [GridItem] = [
        GridItem(.flexible(maximum: 80)),
        GridItem(.flexible(maximum: 80))
    ]
    
    var body: some View {
        // 1 - LazyVGrid
        ScrollView {
            
            // Hero 부분 (위에 사진 부분)
            Rectangle()
                .fill(Color.orange)
                .frame(height: 400)
            
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 6,
                pinnedViews: [.sectionHeaders]){
                    // Section 1
                    Section(header: Text("Section1")
                        .foregroundColor(.white)
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .padding()
                    ){
                        ForEach(0..<20){index in
                            Rectangle()
                                .fill(Color.gray)
                                .frame(height: 150)
                                .overlay(
                                    Text("\(index)번")
                                )
                        }
                    } // : Section 1
                    
                    // Section2
                    Section(header: Text("Section2")
                        .foregroundColor(.white)
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .padding()
                    ) {
                        ForEach(0..<20){index in
                            Rectangle()
                                .fill(Color.green)
                                .frame(height: 150)
                                .overlay(
                                    Text("\(index)번")
                                )
                        }
                    } // : Section 2
                }
        } // 1번
        
        // LazyHGrid
        
        // ScrollView horizontal
        ScrollView(.horizontal){
            LazyHGrid(rows: layout, spacing: 20) {
                ForEach(title, id: \.self){ item in
                    // ForEach를 사용하여 title 배열의 모든 요소에 대해 반복하면서 각 항목을 item으로 인식합니다. 여기서 id 매개 변수는 고유 식별자를 지정하는 데 사용됩니다. .self는 item의 값 자체를 식별자로 사용하도록 지정됩니다
                    VStack {
                        Capsule()
                            .fill(Color.yellow)
                            .frame(height: 30)
                        Text(item)
                            .foregroundColor(Color.blue)
                    }
                }
            }
            
        }
    }
}

struct LazyGridBasic_Previews: PreviewProvider {
    static var previews: some View {
        LazyGridBasic()
    }
}


/*
 이 예제에서는 3개의 유연한 열의 크기를 갖도록 설정되어 있습니다. 화면의 기본 구성은 Rectangle()를 사용하여 오렌지색 400pt 높이의 직사각형을 생성하고, 이어서 LazyVGrid가 따라오도록 구성되어 있습니다. 코드에서 LazyVGrid 의 body 부분에는 Section이 포함되어 있고, 각 섹션은 제목, 배경색 및 뷰가 생성됩니다. 각 섹션 내에서는 ForEach를 사용하여 각 뷰를 반복합니다. 코드에서는 Rectangle()을 사용하여 각 뷰를 생성하고 있으며, 반복되는 뷰마다 색상, 높이 및 텍스트가 다릅니다.  이러한 뷰를 디자인할 때, overlay Modifier를 사용하여 뷰의 상단에 텍스트를 추가하고 있습니다. 마지막으로, ScrollView를 사용하여 뷰를 스크롤 가능하게 만드는 부분이 포함되어 있습니다.  LazyVGrid는 필요에 따라 동적으로 뷰를 로드하기 때문에, 많은 항목을 가진 목록을 만들어도 성능상으로 문제가 발생하지 않습니다.
 */
