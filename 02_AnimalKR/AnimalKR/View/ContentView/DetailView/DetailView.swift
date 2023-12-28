//
//  DetailView.swift
//  AnimalKR
//
//  Created by Jacob Ko on 2022/12/24.
//

import SwiftUI

struct DetailView: View {
	
	// property
	let animal: Animal
	
    var body: some View {
        
        //💁 VStack 안에 요소 즉 단위가 10개까지임 넘어가면 VStack을 또 만들어 안에 만들어야함 
		ScrollView {
			VStack (spacing: 20) {
				// 1. HeadImage
				Image(animal.image)
					.resizable()
					.scaledToFit()
				
				// 2. Title
				Text(animal.name)
					.font(.largeTitle)
					.fontWeight(.heavy)
					.padding(.vertical, 10)
					.background(
						Color.accentColor
							.frame(height: 6)
							.offset(y: 25) // 아래로 내려서 언더라인 만들기
					)
				
				// 3. HeadLine
				Text(animal.headline)
					.font(.title3)
					.multilineTextAlignment(.center)
					.foregroundColor(.accentColor)
					.padding()
				
                
                // 💁 DetailHead 처럼 반복되는 코드는 컴포넌트화 하는게 좋음
				// 4. Gallary
				Group { // 그룹 함수를 이용해 가독성 높이기 그리고 VStack은 요소가 10개를 넘을 수가 없음
					DetailHead(headingImage: "photo.on.rectangle.angled", headingText: "\(animal.name) 사진들")
					
					DetailGallery(animal: animal)
				}  //: GROUP
				
				
				// 5. Description
				Group {
					DetailHead(headingImage: "info.circle", headingText: "자세한 정보")
					Text(animal.description)
						.font(.subheadline)
						.padding(.horizontal, 10)
				}  //: GROUP
				
				// 6. Fact
				Group {
					DetailHead(headingImage: "location.magnifyingglass", headingText: "팩트체크")
					DetailFact(animal: animal)
				}  //: GROUP
				
				// 7. Fact
				Group {
					DetailHead(headingImage: "books.vertical", headingText: "참고 자료")
					ExternalWebLink(animal: animal)
				} //: GROUP
				
				// 8. Copyright
				Text(animal.copyright)
					.font(.footnote)
					.multilineTextAlignment(.leading)
					.foregroundColor(.secondary)
					.padding(.horizontal)
				
			}  //: VSTACK
			.navigationBarTitle("\(animal.name) 자세히 알아보기", displayMode: .inline)
		}  //: SCROLL
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        // 💁 하위뷰에서 navigationBarTitle 설정시 프리뷰 확인이 어려움 이럴때는 아래와 같이 해주면 확인 할 수 있음
		NavigationView {
			DetailView(animal: Animal.sampleAnimal)
		}
    }
}
