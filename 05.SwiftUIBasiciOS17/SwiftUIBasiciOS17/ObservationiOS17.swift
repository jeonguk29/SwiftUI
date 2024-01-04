//
//  ObservationiOS17.swift
//  SwiftUIBasiciOS17
//
//  Created by Jacob Ko on 16/11/23.
//

import SwiftUI

struct ObservationiOS17: View {
	
	// 기존에 ViewModel 에서 가져오기 -> EnviromentObject 로
    // 💁  @EnvironmentObjec로 한번 선언한다음 전체 APP단위로 사용할때 방식
    @EnvironmentObject private var vm1: UserObservableObject
   
	
	// iOS17 부터는 -> Environment 로 가져오기
	@Environment(UserObservableMacro.self) private var vm2
	
    var body: some View {
		// 위에서 vm2 를 enviroment 로 불러오고 body 안쪽에 @Bindable 해줘야 body 와 연결해서 사용가능
        
        // 💁 View와 연결 하기 위해 꼭 해줘야 한다고 생각하면 이해하기 편함
		@Bindable var vm3 = vm2
		
		VStack (spacing: 30) {
			Text("1. VM 비교")
				.font(.title)
			
			// vm1
			HStack {
				Menu("\(vm1.name): \(vm1.number)") {
					ForEach(10..<20) { index in
						Button(String(index)) {
							vm1.number = index
						}
					}
				}
				.buttonStyle(.borderedProminent)
				.tint(.red)
				
				Spacer()
				
				Toggle("VM1 Toggle", isOn: $vm1.isClick)
				
			}
			
			// vm2
			HStack {
				Menu("\(vm3.name): \(vm3.number)") {
					ForEach(20..<30) { index in
						Button(String(index)) {
							vm3.number = index
						}
					}
				}
				.buttonStyle(.borderedProminent)
				.tint(.red)
				
				Spacer()
				
				Toggle("VM2 Toggle", isOn: $vm3.isClick)
				
			}
			
			Divider()
			Text("2. SubView 비교")
				.font(.title)
			
			// BindingView1 연결 - @ObservedObejct 사용 (기존에 MainView -> SubView 로 넘길때)
			BindingView1(vm1: vm1)
			
			// BindingView2 연결 - vm 연결시 custom Object mutable 값이기때문에 @Bindable 사용
			BindingView2(vm2: vm3)
			
            // 💁 하나의 뷰모델을 공유 하는 거라 상위 뷰에서 값 변경시 하위뷰 또한 같이 변경되는것을 알 수 있음
            
		}
		.font(.title2)
		.padding()
    }
}

// MARK: - SUBVIEW
struct BindingView1: View {
	
	// 기존에 SubView 에서 VM 을 넘길때
	@ObservedObject var vm1: UserObservableObject
	
	var body: some View {
		HStack {
			Menu("\(vm1.name): \(vm1.number)") {
				ForEach(10..<20) { index in
					Button(String(index)) {
						vm1.number = index
					}
				}
			}
			.buttonStyle(.borderedProminent)
			.tint(.red)
			
			Spacer()
			
			Toggle("VM1 Toggle", isOn: $vm1.isClick)
			
		}
	}
}



struct BindingView2: View {
	
	@Bindable var vm2: UserObservableMacro
	
	var body: some View {
		HStack {
			Menu("\(vm2.name): \(vm2.number)") {
				ForEach(20..<30) { index in
					Button(String(index)) {
						vm2.number = index
					}
				}
			}
			.buttonStyle(.borderedProminent)
			.tint(.red)
			
			Spacer()
			
			Toggle("VM2 Toggle", isOn: $vm2.isClick)
			
		}
	}
}




#Preview {
    ObservationiOS17()
		.environmentObject(UserObservableObject())
		.environment(UserObservableMacro())
}

/*
 // 💁  iOS 17에 조금 사용 방식만 바뀐 거고 크게 개념은 바뀐게 없음
 근데 좀 더 매크로를 사용해서 Observation Framework를 통해서 뷰 모델에서 Published 사용하지 않고 Observable Wrapper를 사용한다는 점 그리고 Environment Object가 아닌 Environment를
    사용하고 Binding 할 때는 Observed Object가 아니라 단순하게
 Bindable로 바뀌었다는 점 이런 점들만 체크하고 나중에 사용하면 될거 같음
 */
