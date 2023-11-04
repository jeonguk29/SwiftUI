//
//  ButtonStyleBasic.swift
//  SwiftUIiOS15Basic
//
//  Created by Jacob Ko on 2022/11/25.
//

import SwiftUI

struct ButtonStyleBasic: View {
    var body: some View {
		ScrollView {
			VStack {
                
              
				Text("1. 일반적인 ButtonStyle")
					.font(.headline)
                
                // 1️⃣
				Button {
					// action
				} label: {
					Text("Plain buttonStyle")
				}
				.frame(height: 50)
				.frame(maxWidth: .infinity)
				.buttonStyle(.plain)
                
                // 2️⃣
				Button {
					// action
				} label: {
					Text("bordered buttonStyle")
				}
				.frame(height: 50)
				.frame(maxWidth: .infinity)
				.buttonStyle(.bordered) // 자동적으로 회색 바탕 보더 생성
				
				Button {
					// action
				} label: {
					Text("borderedProminent buttonStyle")
				}
				.frame(height: 50)
				.frame(maxWidth: .infinity)
				.buttonStyle(.borderedProminent) // 바탕 파랑의 글자 하얀색
				
				Button {
					// action
				} label: {
					Text("borderless buttonStyle")
				}
				.frame(height: 50)
				.frame(maxWidth: .infinity)
				.buttonStyle(.borderless) // 파란색의 글자만 나옴

			} //: VSTACK
			.padding()
			
			Divider()
			
            // 기본적으로 라운드도 점점 커짐
			VStack {
				Text("2. Controlsize 로 버튼 크기 자동 설정")
					.font(.headline)
				
				Button {
					// action
				} label: {
					Text("large controlSize")
				}
				.frame(height: 50)
				.frame(maxWidth: .infinity)
				.buttonStyle(.borderedProminent)
				.controlSize(.large)
				
				Button {
					// action
				} label: {
					Text("regular controlSize")
				}
				.frame(height: 50)
				.frame(maxWidth: .infinity)
				.buttonStyle(.borderedProminent)
				.controlSize(.regular)
				
				Button {
					// action
				} label: {
					Text("small controlSize")
				}
				.frame(height: 50)
				.frame(maxWidth: .infinity)
				.buttonStyle(.borderedProminent)
				.controlSize(.small)
				
				Button {
					// action
				} label: {
					Text("mini controlSize")
				}
				.frame(height: 50)
				.frame(maxWidth: .infinity)
				.buttonStyle(.borderedProminent)
				.controlSize(.mini)

			} //: VSTACK
			.padding()
		} //: SCROLL
    }
}

struct ButtonStyleBasic_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBasic()
    }
}
