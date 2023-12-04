//
//  MainView.swift
//  SwiftAPIDemo
//
//  Created by 정정욱 on 12/4/23.
//

import SwiftUI
//struct GIFView: View {
//    let gifName: String
//
//    var body: some View {
//        guard let gifURL = Bundle.main.url(forResource: gifName, withExtension: "gif") else {
//            return AnyView(EmptyView())
//        }
//
//        guard let source = CGImageSourceCreateWithURL(gifURL as CFURL, nil) else {
//            return AnyView(EmptyView())
//        }
//
//        let frameCount = CGImageSourceGetCount(source)
//        var images: [UIImage] = []
//
//        for i in 0..<frameCount {
//            guard let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) else { continue }
//            let uiImage = UIImage(cgImage: cgImage)
//            images.append(uiImage)
//        }
//
//        return AnyView(
//            AnimatedImage(images: images)
//                .frame(width: 200, height: 200)
//        )
//    }
//}
//
//struct AnimatedImage: UIViewRepresentable {
//    let images: [UIImage]
//
//    func makeUIView(context: UIViewRepresentableContext<AnimatedImage>) -> UIImageView {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }
//
//    func updateUIView(_ uiView: UIImageView, context: UIViewRepresentableContext<AnimatedImage>) {
//        uiView.animationImages = images
//        uiView.animationDuration = Double(images.count) * 0.1 // Adjust animation speed if needed
//        uiView.startAnimating()
//    }
//}

struct Main_View: View {
    @State private var inputValue: String = ""
    @State private var isNextViewActive = false
    
    var body: some View {
            NavigationView {
                VStack {
                    TextField("무엇을 그리고 싶나요?", text: $inputValue)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    NavigationLink(
                        destination: AiMainView(inputValue: inputValue),
                        label: {
                            Text("다음으로 이동")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        })
                        .padding()
                }
                .padding()
            }
        }
}


#Preview {
    Main_View()
}


