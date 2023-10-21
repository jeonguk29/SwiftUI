//
//  TextFieldBasic.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/08/20.
//

import SwiftUI

struct TextFieldBasic: View {
    
    // property
    @State var inputText: String = ""
    @State var userNameData: [String] = []
    
    var body: some View {
        
        NavigationView {
            VStack (spacing: 20) {
                
                // TextField 한줄 - 적은양의 text 입력시 사용
                // TextField("최소 2글자 이상 입력", text: $inputText)
                //     // .textFieldStyle(.roundedBorder)
                //     .padding()
                //     .background(Color.gray.opacity(0.3))
                //     .cornerRadius(10)
                //     .font(.headline)
                
                
                // TexEditor 여러줄 - 긴글 의 text 를 입력할때 사용
                TextEditor(text: $inputText)
                    .frame(height: 250) // 크기 설정
                    .colorMultiply(Color.gray.opacity(0.5))
                
                Button {
                    // 이름이 2글자 이상 일때 saveText 가 되도록 조건 설정
                    if isTextEnough() {
                        saveText()
                    }
                } label: {
                    Text("save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isTextEnough() ? Color.blue : Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .disabled(!isTextEnough()) // 충족하지 않으면 실행되지 않도록
                
                ForEach(userNameData, id: \.self) { item in
                    Text(item)
                }
                
                Spacer()
            }// : VStack
            .padding()
            .navigationTitle("당신의 이름은?")
            
        } // : Navigation
    } // : Body
    
    // function
    func isTextEnough() -> Bool {
        // 2개 이상의 텍스트가 되면 ture, 아니면 false
        if inputText.count >= 2 {
            return true
        } else {
            return false
        }
    }
    
    func saveText() {
        userNameData.append(inputText)
        inputText = ""
    }
}

struct TextFieldBasic_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldBasic()
    }
}
