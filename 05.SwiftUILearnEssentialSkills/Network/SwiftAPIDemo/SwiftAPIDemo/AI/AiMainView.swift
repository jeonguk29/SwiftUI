//
//  AiMainView.swift
//  SwiftAPIDemo
//
//  Created by 정정욱 on 12/4/23.
//

import SwiftUI
import ImageIO



struct AiMainView: View {
    var inputValue: String?
    @StateObject var network = AiAPI.shared
    @State private var images: [UIImage] = []
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible())], spacing: 16) {
                ForEach(images, id: \.self) { image in
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .padding()
        }
        .onAppear {
            guard let inputValue = inputValue else {
                // inputValue가 nil인 경우에 대한 처리 로직
                return
            }
            network.createImageFromPrompt(prompt: inputValue) { result in
                switch result {
                case .success(let jsonString):
                    if let jsonData = jsonString.data(using: .utf8),
                       let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any],
                       let outputs = jsonObject["outputs"] as? [[String: Any]],
                       let firstOutput = outputs.first,
                       let imageUrlString = firstOutput["image_url"] as? String,
                       let imageUrl = URL(string: imageUrlString) {
                        // 이미지 로드 및 업데이트
                        URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
                            if let error = error {
                                print(error)
                                return
                            }
                            
                            guard let data = data, let image = UIImage(data: data) else {
                                print("이미지를 로드할 수 없습니다.")
                                return
                            }
                            
                            DispatchQueue.main.async {
                                images.append(image)
                            }
                        }.resume()
                    }
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

struct AiMainView_Previews: PreviewProvider {
    static var previews: some View {
        AiMainView(inputValue: "멋쟁이 사자")
    }
}
