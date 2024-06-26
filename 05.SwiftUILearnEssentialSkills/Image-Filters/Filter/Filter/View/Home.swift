//
//  Home.swift
//  Filter
//
//  Created by 정정욱 on 6/26/24.
//

import SwiftUI

// Home 뷰를 정의합니다.
struct Home: View {
    // HomeViewModel을 StateObject로 선언하여 상태를 관리합니다.
    @StateObject var homeData = HomeViewModel()
    
    var body: some View {
        VStack {
            
            // 이미지 데이터가 비어 있지 않고 mainView가 nil이 아닐 때
            if !homeData.allImages.isEmpty && homeData.mainView != nil {
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                // mainView의 이미지를 화면에 표시합니다.
                Image(uiImage: homeData.mainView.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width)
                
                // 슬라이더를 추가하여 homeData.value 값을 조정할 수 있게 합니다.
                Slider(value: $homeData.value)
                    .padding()
                    .opacity(homeData.mainView.isEditable ? 1 : 0)
                    .disabled(homeData.mainView.isEditable ?  false : true)
                
                // 가로 스크롤 가능한 이미지 목록을 표시합니다.
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20, content: {
                        ForEach(homeData.allImages) { filtered in
                            Image(uiImage: filtered.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                            
                            // 이미지를 탭할 때 메인 이미지를 변경합니다.
                                .onTapGesture {
                                    // 기존 데이터를 초기화합니다.
                                    homeData.value = 1.0
                                    homeData.mainView = filtered
                                }
                        }
                    })
                    .padding()
                }
                
            }
            // 이미지 데이터가 없을 때 표시할 텍스트
            else if homeData.imageData.count == 0 {
                Text("Pick An Image To Process !!!")
            }
            // 이미지 데이터를 로딩 중일 때 표시할 뷰
            else {
                ProgressView()
            }
        }
        // homeData.value가 변경될 때 호출되는 함수
        .onChange(of: homeData.value, perform: { (_) in
            homeData.updateEffect()
        })
        // homeData.imageData가 변경될 때 호출되는 함수
        .onChange(of: homeData.imageData, perform: { (_) in
            // 이미지가 변경될 때 기존 데이터를 초기화하고 필터를 로드합니다.
            homeData.allImages.removeAll()
            homeData.mainView = nil
            homeData.loadFilter()
        })
        // 툴바에 버튼을 추가합니다.
        .toolbar {
            // 이미지 선택 버튼
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {homeData.imagePicker.toggle()}, label: {
                    
                    Image(systemName: "photo")
                        .font(.title2)
                })
            }
            
            // 이미지를 저장하는 버튼
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // 이미지를 저장하는 액션
                    UIImageWriteToSavedPhotosAlbum(homeData.mainView.image, nil, nil, nil)
                } label: {
                    Image(systemName: "square.and.arrow.up.fill")
                        .font(.title2)
                }
                // 이미지가 없을 때 버튼을 비활성화합니다.
                .disabled(homeData.mainView == nil ?  true : false)
            }
        }
        // 이미지 선택 시트
        .sheet(isPresented: $homeData.imagePicker, content: {
            ImagePicker(picker: $homeData.imagePicker, imageData: $homeData.imageData)
        })
    }
}

// 프리뷰를 위한 코드
#Preview {
    Home()
}
