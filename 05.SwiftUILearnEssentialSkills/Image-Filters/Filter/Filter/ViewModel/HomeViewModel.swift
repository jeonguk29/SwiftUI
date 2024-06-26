//
//  HomeViewModel.swift
//  Filter
//
//  Created by 정정욱 on 6/26/24.
//

import SwiftUI
import CoreImage // CoreImage: 이미지 처리와 필터링을 위한 프레임워크입니다.
import CoreImage.CIFilterBuiltins //기본 제공되는 필터들을 사용하기 위한 모듈입니다.

class HomeViewModel: ObservableObject {
    @Published var imagePicker = false // 이미지 선택기를 표시할지 여부
    @Published var imageData = Data(count: 0) // 선택된 이미지의 데이터
    @Published var allImages: [FilteredImage] = [] // 필터가 적용된 모든 이미지를 저장

    // Main Editing Image...
    @Published var mainView: FilteredImage! //커스텀 필터를 적용할 현재 편집 중인 이미지
    
    /* Slider For Intensity And Radius ... etc...
       Since WE didnt set while reading image
       so all will be full value....
     */
    
    @Published var value : CGFloat = 1.0 // 필터의 강도나 반경을 조절하는 슬라이더 값입니다.

    
    // Loading FilterOption WhenEver Image is Selected ....

    // Use Your Own Filters...
    let filters : [CIFilter] = [
        CIFilter.sepiaTone(), CIFilter.comicEffect(), CIFilter.colorInvert(), CIFilter.photoEffectFade(),
        CIFilter.colorMonochrome(), CIFilter.photoEffectChrome(), CIFilter.gaussianBlur(), CIFilter.bloom()
    ]
    // 적용 가능한 필터들을 배열로 정의
    
    
    func loadFilter() {
        
        let context = CIContext() // Core Image 프레임워크의 컨텍스트 객체로, 이미지 처리를 위한 환경을 제공
        
        filters.forEach { (filter) in
            
            // To Avoid Lag Do it in bacground...
            
            // 비동기적으로 백그라운드 스레드에서 작업을 수행합니다. qos: .userInteractive는 사용자와의 상호작용이 필요한 작업에 높은 우선순위를 부여합니다. : UI가 멈추지 않도록
            DispatchQueue.global(qos: .userInteractive).async {
                // loading Image Into Filter...
                let CiImage = CIImage(data: self.imageData)
                
                filter.setValue(CiImage!, forKey: kCIInputImageKey)  // 필터의 입력 이미지로 CiImage를 설정합니다.
                
                // retreving Image....
                guard let newImage = filter.outputImage else {return} // 필터링된 이미지를 newImage로 가져오고, 만약 실패하면 함수를 종료
                
                //creating UIImage...
                
                let cgimage = context.createCGImage(newImage, from: newImage.extent) //  newImage를 CGImage로 변환합니다. CGImage는 Core Graphics 프레임워크의 이미지 객체
                
                let isEditable = filter.inputKeys.count > 1 // 필터의 입력 키가 1개 이상인지 확인하여 편집 가능 여부를 설정합니다.
                
                // FilteredImage: 필터링된 이미지 데이터를 저장하는 커스텀 객체입니다. UIImage 객체로 변환된 cgimage, 필터 객체, 편집 가능 여부를 포함합니다.
                let filteredData = FilteredImage(image: UIImage(cgImage: cgimage!), filter: filter, isEditable : isEditable)
                
                DispatchQueue.main.async {
                    self.allImages.append(filteredData)
                    
                    // default is First Filter..
                    
                    if self.mainView == nil {self.mainView = self.allImages.first} // mainView가 아직 설정되지 않았다면, 첫 번째 필터링된 이미지를 기본값으로 설정
                    
                }
            }
            
        }
    }
    
    func updateEffect() {
        
        let context = CIContext()
        
        
        DispatchQueue.global(qos: .userInteractive).async {
            // loading Image Into Filter...
            let CiImage = CIImage(data: self.imageData)
            
            let filter = self.mainView.filter
            
            filter.setValue(CiImage!, forKey: kCIInputImageKey)
            
              // 이미지 검색 중....
             // inputKey를 읽는 중...
             // 사용할 수 있는 사용자 정의 옵션이 많이 있습니다.
             // 반경과 강도만 사용하고 있습니다..
             // 당신의 것을 기반으로 자신의 것을 사용하십시오•
            
            // 뭐뭐 설정이 가능한거지?
            
            if filter.inputKeys.contains("inputRadius"){ // 필터가 inputRadius 키를 지원하는지 확인합니다.
                filter.setValue(self.value * 10, forKey: kCIInputRadiusKey) //  inputRadius 키의 값을 설정합니다.
            }
            if filter.inputKeys.contains("inputIntensity"){
                filter.setValue(self.value, forKey: kCIInputIntensityKey)
            }
          
            print(filter.inputKeys) // 필터의 입력키를 출력
            
            guard let newImage = filter.outputImage else {return}
            
            //creating UIImage...
            
            let cgimage = context.createCGImage(newImage, from: newImage.extent) //newImage를 CGImage로 변환합니다.
            
    
            DispatchQueue.main.async {
                // Updating View...
                self.mainView.image = UIImage(cgImage: cgimage!) // 설정 끝나면 메인뷰 이미지 업데이트
            }
        }
    }
}
