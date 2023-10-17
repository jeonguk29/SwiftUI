//
//  AlertBasic.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/08/19.
//

import SwiftUI

struct AlertBasic: View {
	// Property
	@State var showAlert1: Bool = false
	@State var showAlert2: Bool = false
	@State var showAlert3: Bool = false
	@State var showAlert4: Bool = false
	
	@State var backgroundColor: Color = Color.yellow
	@State var alertTitle: String = ""
	@State var alertMessage: String = ""
	@State var alertType: AlertCase? = nil
	
	
	enum AlertCase { // 실제로 이런식으로 많이 이용함
		case success // 성공할때 이런 로직
		case error // 실패할때 이런 로직
	}
	
    var body: some View {
		ZStack {
			// background
			backgroundColor.ignoresSafeArea()
			
			VStack (spacing: 20) {
				
				// 1
				Button {
					showAlert1.toggle()
				} label: {
					Text("1번 Alert")
				}
				.alert(isPresented: $showAlert1) {
                    // isPresented : 언제 나타 낼꺼야? $showAlert1가 참이 아니면 아래가 뜸
					Alert(title: Text("페스워드 에러 입니다. 다시 확인하세요"))
				}
				
				// 2
				Button {
					showAlert2.toggle()
				} label: {
					Text("2번 Alert")
				}
				.alert(isPresented: $showAlert2) {
					getAlert2()
				}
				
				// 3
				HStack (spacing: 10) {
					Button {
						alertTitle = "영상이 업로드 에러"
						alertMessage = "영상이 제대로 올라가지 않았습니다. 다시 확인해 주세요"
						showAlert3.toggle()
					} label: {
						Text("3번 Alert 실패시")
					}
					
					Button {
						alertTitle = "영상이 업로드 성공"
						alertMessage = "영상이 제대로 올라갔습니다"
						showAlert3.toggle()
					} label: {
						Text("3번 Alert 성공시")
					}
				} // : HStack
				.alert(isPresented: $showAlert3) {
					getAlert3()
				}
				
				// 4
				
				HStack (spacing: 10) {
					Button {
						alertType = .error
						showAlert4.toggle()
					} label: {
						Text("4번 Alert 실패시")
					}
					
					Button {
						alertType = .success
						showAlert4.toggle()
					} label: {
						Text("4번 Alert 성공시")
					}
				} // : HStack
				.alert(isPresented: $showAlert4) {
					getAlert4()
				}
				

			} // :VStack
		} // : ZStack
    } // : Body
	
	// fuction
	func getAlert2() -> Alert { // Alert을 커스텀
		return Alert(
			title: Text("메세지 삭제"),
			message: Text("정말 메세지 삭제 하시겠습니까?"),
			primaryButton: .destructive(Text("Delete"), action: {
				backgroundColor = .red
			}),
			secondaryButton: .cancel()) // 기본적으로 제공해주는 cancel버튼
	}
	
	func getAlert3() -> Alert {
		return Alert(
			title: Text(alertTitle),
			message: Text(alertMessage),
			dismissButton: .default(Text("OK")))
	}
	
	func getAlert4() -> Alert {
		switch alertType {
		case .error:
			return Alert(title: Text("에러발생 다시 확인하세요"), dismissButton: .default(Text("OK"), action: {
				backgroundColor = .red
			}))
		
		case .success:
			return Alert(title: Text("로그인에 성공 했습니다"), dismissButton: .default(Text("OK"), action: {
				backgroundColor = .green
			}))
		default:
			return Alert(title: Text("에러"))
		}
	}
}

struct AlertBasic_Previews: PreviewProvider {
    static var previews: some View {
        AlertBasic()
    }
}
