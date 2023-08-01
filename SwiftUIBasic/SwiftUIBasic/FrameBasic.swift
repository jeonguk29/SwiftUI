//
//  FrameBasic.swift
//  SwiftUIBasic
//
//  Created by 정정욱 on 2023/08/01.
//

import SwiftUI

struct FrameBasic: View {
    var body: some View {
        VStack(spacing: 20){
            // 1
            Text("Hello, World!")
                .font(.title)
                .background(Color.green)
            //뷰는 자신의 콘텐트와 자신이 속한 레이아웃에 따라 자동으로 크기가 조절됩니다. 하지만 frame 수정자를 사용하여 뷰의 크기나 영역을 조절 할 수 있습니다.
                .frame(width: 200, height: 200)
                .background(Color.red)
            
            Divider()
            // 2
            Text("Hello, World!")
                .font(.title)
                .background(Color.green)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            // 주로 사용되는 속성 max 값으로 infinity를 넣어주면 현제 자신이 가질수 있는 최대치의 값을 가지게 됨
                .background(Color.red)
            
        }
        
        // 3 : VStack 하나 만들때마다 새로운 프리뷰가 생김
        VStack(spacing: 20){
            Text("Hello World!")
                .font(.title)
                .background(Color.red)
                .frame(height: 100, alignment: .top)
            // 100프레임에 대한 컨텐츠는 위에 붙게됨
                .background(.orange)
                .frame(width: 200)
                .background(Color.purple)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.pink)
                .frame(height: 400)
                .background(Color.green)
                .frame(maxHeight: .infinity, alignment: .top)
                .background(Color.yellow)
            
            }
        
        
    }
}

struct FrameBasic_Previews: PreviewProvider {
    static var previews: some View {
        FrameBasic()
    }
}

// 커멘드, shift, k 누르면 clean이 됨 :  빨간줄 빠르게 없애기
