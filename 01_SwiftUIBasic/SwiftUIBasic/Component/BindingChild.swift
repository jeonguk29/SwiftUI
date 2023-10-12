//
//  BindingChild.swift
//  SwiftUIBasic
//
//  Created by 정정욱 on 2023/08/08.
//

import SwiftUI

struct BindingChild: View {
    // property
    @State var buttonColor: Color = Color.blue
    
    // @State 를 Subview (하위뷰) 에서 넘겨받기 위해  @Binding(묶어주다) 사용 : 이름도 같아야함
    @Binding var backgroundColor: Color
    @Binding var title: String
    
    var body: some View {
        Button{
            //ACTION
            backgroundColor = Color.orange
            buttonColor = Color.pink
            title = "Binding Child View"
        } label: {
            Text("Child View 이동")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .cornerRadius(10)
        }
    }
}

struct BindingChild_Previews: PreviewProvider {
    static var previews: some View {
        BindingChild(backgroundColor: .constant(Color.orange), title: .constant("Binding Child"))
            .previewLayout(.sizeThatFits)
    }
}
