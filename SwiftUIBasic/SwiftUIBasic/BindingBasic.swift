//
//  BindingBasic.swift
//  SwiftUIBasic
//
//  Created by 정정욱 on 2023/08/08.
//

import SwiftUI

struct BindingBasic: View {
    // property
    @State var backgroundColor: Color = Color.green
    @State var title: String = "Binding Basic View"

    var body: some View {
        ZStack {
            // background
            backgroundColor
                .ignoresSafeArea()
            
            //content
            VStack{
                Text(title)
                
                // button
                // parameter로 @State의 값에 $ 붙여 줍니다. : State 값들이 넘어감, 서브뷰에서는 @Binding을 사용해야지만 값을 넘겨 받을수 있음 
                BindingChild(backgroundColor: $backgroundColor, title: $title)
            }
            
        }
    }
}

struct BindingBasic_Previews: PreviewProvider {
    static var previews: some View {
        BindingBasic()
    }
}
