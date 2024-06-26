//
//  FilteredImage.swift
//  Filter
//
//  Created by 정정욱 on 6/26/24.
//

import SwiftUI
import CoreImage // 이미지 처리와 필터링 작업을 하는데 사용되는 프레임워크

struct FilteredImage: Identifiable {
    
    var id = UUID().uuidString
    var image: UIImage
    var filter: CIFilter // 이미지에 적용할 필터를 저장
    
    var isEditable: Bool // 커스텀할때 사용 편집 가능한지 여부를 나타냄 
}
