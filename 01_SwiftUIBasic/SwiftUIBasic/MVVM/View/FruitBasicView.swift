//
//  FruitBasicView.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/11/04.
//

import SwiftUI

struct FruitBasicView: View {
	
	// property
    
     //View에 값을 가져오려면 @ObservedObject, @StateObject 두가지가 있음
     
	
	// @ObservedObject 사용하여 ViewModel 객체화 하기 -> SubView 에서 사용 (부모 View 값을 넘겨 받았을 경우)
    // @ObservedObject var fruitViewModel = FruitViewModel()
	
	// @StateObject 사용하여 ViewModel 객체화 하기 -> View 가 처음 생성, 초기화 할때, 부모View에서 주로 사용
	@StateObject var fruitViewModel = FruitViewModel() // 뷰모델 뷰가 가짐
	
	
    var body: some View {
		NavigationView {
			List {
				if fruitViewModel.isLoading {
					ProgressView() // 로딩 중이면 빙글빙글 
				} else {
					ForEach(fruitViewModel.fruitArray) { fruit in
						HStack (spacing: 20) {
							Text("\(fruit.count)")
								.foregroundColor(.red)
							Text(fruit.name)
								.font(.headline)
								.bold()
						} //: HSTACK
					} //: LOOP
				} //: CONDITIONAL
			} //: LIST
//			.onAppear {
//				fruitViewModel.getFruit()
            // 사용시 서브뷰가 있으면 다시 돌아올때 중복이 되서 배열 원소가 계속 생성됨 
//			}
			.navigationBarItems(
				trailing:
					NavigationLink(
						destination: SecondScreen(fruitViewModel: fruitViewModel),
						label: {
							Image(systemName: "arrow.right")
								.font(.title)
						}))
			.navigationTitle("과일 리스트")
		} //: NAVIGATION
    }
}


// SecondScreen

struct SecondScreen: View {
	
	// property
	// 이미 @StateObject 에서 ViewModel 을 초기화 하였고, SubView에 넘겨 주었기 때문에 2중으로 초기화가 된것입니다. 이렇게 되면 상위뷰와 하위뷰가 연결되지 않고 독립적인 상태가 됩니다.
//	@ObservedObject var fruitViewModel = FruitViewModel()
	@ObservedObject var fruitViewModel: FruitViewModel
	
	@Environment(\.presentationMode) var presentationMode
	
	
	var body: some View {
		ZStack {
			// background
			Color.green.ignoresSafeArea()
			
			// forground
			VStack (spacing: 20) {
				ForEach(fruitViewModel.fruitArray) { fruit in
					Text(fruit.name)
						.font(.headline)
						.foregroundColor(.white)
				} //: LOOP
				
				Button {
					presentationMode.wrappedValue.dismiss()
				} label: {
					Text("뒤로 가기")
						.font(.largeTitle)
						.foregroundColor(.white)
						.fontWeight(.bold)
				}

			} //: VSTACK
		} //: ZSTACK
	}
}



struct FruitBasicView_Previews: PreviewProvider {
    static var previews: some View {
        FruitBasicView()
    }
}
