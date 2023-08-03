//
//  InitEnumBasic.swift
//  SwiftUIBasic
//
//  Created by 정정욱 on 2023/08/03.
//

import SwiftUI

struct InitEnumBasic: View {
    
    // 변수 선언
    let backgroundColor: Color
    let count: Int
    let title: String
    
    // enum 생성
    enum Fruit {
        case apple
        case orange
    }
    
    // init 함수 생성
    init(count: Int, fruit: Fruit) {
        self.count = count
        
        if fruit == .apple {
            self.title = "사과"
            self.backgroundColor = .red
        } else {
            self.title = "오렌지"
            self.backgroundColor = .orange
            
        }
    }
    
    var body: some View {
        // UI 설정
        VStack(spacing: 20) {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .underline()
            
            Text("\(title)")
                .font(.headline)
                .foregroundColor(.white)
            }
            .frame(width: 150,height: 150)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}

struct InitEnumBasic_Previews: PreviewProvider {
    static var previews: some View {
        HStack{ // 여기도 HStack, 등 모든 문법 사용 가능함
            InitEnumBasic(count: 100, fruit: .apple)
            
            InitEnumBasic(count: 46, fruit: .orange)
        }
    }
    // SwiftUI에서 프리뷰를 보여줄때 InitEnumBasic() 이처럼 생성자를 호출하게 되는데 우리가 생성자의 매개변수를 받게 수정을 해줬음
}
