//
//  ImagePicker.swift
//  Filter
//
//  Created by 정정욱 on 6/26/24.
//

import SwiftUI
import PhotosUI // 사진 라이브러리 기능 사용가능

struct ImagePicker: UIViewControllerRepresentable { // SwiftUI에서 UIKit의 뷰 컨트롤러를 사용할 수 있게 함
    
    @Binding var picker : Bool // 이미지 피커가 표시되고 있는지 여부를 나타내는 Bool 값입니다.
    @Binding var imageData : Data // 선택된 이미지의 데이터입니다.
    
    
    func makeCoordinator() -> Coordinator {
        /*
         Coordinator 객체는 SwiftUI와 UIKit 간의 상호작용을 관리하기 위해 사용
         UIKit 뷰 컨트롤러의 델리게이트 메서드를 처리합니다.
         */
        return ImagePicker.Coordinator(parent: self)
    }
    
    
    // PHPickerViewController를 생성하고, 델리게이트를 context.coordinator로 설정
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = PHPickerViewController(configuration: PHPickerConfiguration())
        picker.delegate = context.coordinator
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        print()
    }
    
    class Coordinator : NSObject, PHPickerViewControllerDelegate {
        // Coordinator는 parent 속성을 가지며, 이는 ImagePicker 구조체와 연결됩니다.
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        /*
         사용자가 이미지를 선택하거나 취소했을 때 호출됩니다.
         results 배열이 비어 있지 않으면 이미지를 선택한 것
         */
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            // Checking image is selected or cancelled.
            
            if !results.isEmpty {
                
                // Checking image can be loaded...
                if results.first!.itemProvider.canLoadObject(ofClass: UIImage.self){
                    results.first!.itemProvider.loadObject(ofClass: UIImage.self) { (image, err) in
                        
                        // 첫 번째 결과가 UIImage 클래스를 로드할 수 있는지 확인합니다.
                        // UIImage 객체로 로드한 후, 메인 스레드에서 imageData를 업데이트하고 picker를 토글합니다.
                        DispatchQueue.main.async {
                            self.parent.imageData = (image as! UIImage).pngData()!
                            self.parent.picker.toggle()
                        }
                        
                    }
                    
                }else {
                    self.parent.picker.toggle()
                }
            }
        }
    }
}
