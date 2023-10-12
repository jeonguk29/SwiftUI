//
//  ColorBasic.swift
//  SwitftUIBasic
//
//  Created by 정정욱 on 2023/07/31.
//

import SwiftUI

struct ColorBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            
            //Basic Color : ex Color.red
            // 데모에서는 사용 많이 하지만 디자이너가 지정해준 컬러를 사용하기위해 실제 앱에서는 잘 사용되지 않음
            Text("Basic Color")
                .font(.title)
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.purple)
                .frame(width: 300, height: 100, alignment: .center)
            
            // Primary Color
            // 자동으로 색 다크지원
            Text("Primary Color")
                .font(.title)
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.primary)
                .frame(width: 300, height: 100, alignment: .center)
            
            // UIColor
            // UIKit에서 사용되는 color 값을 사용할 수 있습니다.
            Text("UI Color")
                .font(.title)
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(UIColor.secondarySystemBackground))
                .frame(width: 300, height: 100)
            
            
            // Custom Color
            // 실질적으로 많이 사용함 디자이너가 준 컬러로
            
            Text("Custom Color")
                .font(.title)
            RoundedRectangle(cornerRadius: 25)
                .fill(Color("CustomColor")) // Assets 파일에서 생성한 이름 그대로 사용
                // 현제 #72FCD5 같은 8bit HEX 값으로 컬러를 명확하게 지정했음 다크모드까지
                .frame(width: 300, height: 100)
            
            
            
                
        }
    }
}

struct ColorBasic_Previews: PreviewProvider {
    static var previews: some View {
        ColorBasic()
        // 다크모드 확인 코드
        //    .preferredColorScheme(.dark)
    }
}
