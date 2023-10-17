//
//  ListBasic.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/08/19.
//

import SwiftUI

struct ListBasic: View {
	// property
	@State var fruits: [String] = [
		"사과", "오렌지", "바나나", "수박"
	]
	
	@State var meats: [String] = [
		"소고기", "돼지고기", "닭고기"
	]
	
    var body: some View {
		NavigationView {
			List {
				Section {
					// content
					ForEach(fruits, id: \.self) { fruit in
						Text(fruit)
							.font(.body)
							.foregroundColor(.white)
							.padding(.vertical)
					}
					.onDelete(perform: delete) // perform 다음 함수를 넣어주면 됨 스와이프 해서 리스트 원소를 하나 삭제 할 수 있음
					.onMove(perform: move) // 셀 꾹 누른후 이동 가능 하게
					.listRowBackground(Color.blue) // 리스트 배경색 지정
				} header: {
					Text("과일종류")
						.font(.headline)
						.foregroundColor(.red)
				} // : Section
				
				Section {
					// content
					ForEach(meats, id: \.self) { meat in
						Text(meat)
					}
				} header: {
					Text("고기종류")
						.font(.headline)
						.foregroundColor(.red)
				}


			} // : List
			.navigationTitle("우리동네 마트")
			.navigationBarTitleDisplayMode(.inline)
			.navigationBarItems(leading: EditButton(), trailing: addButton)
            // EditButton는 swiftUI에서 지원해주는 버튼임
            // 리스트를 제어 할 수 있게 해줌
            
            // addButton 함수가 아니라 뷰타입으로 만들어야함
            
            
		} // :Navigation
    } // :Body
	
	// Fuction
	func delete(indexSet: IndexSet) {
		fruits.remove(atOffsets: indexSet) // IndexSet는 테이블 뷰의 인덱스 패스와 비슷함
	}
	
	func move(indices: IndexSet, newOffset: Int) {
		//indices 처음 선택한 값, newOffset 이동할 위치 값
        fruits.move(fromOffsets: indices, toOffset: newOffset)
	}
	
	var addButton: some View {
		Button {
			fruits.append("딸기")
		} label: {
			Text("Add")
		}

	}
}

struct ListBasic_Previews: PreviewProvider {
    static var previews: some View {
        ListBasic()
    }
}
