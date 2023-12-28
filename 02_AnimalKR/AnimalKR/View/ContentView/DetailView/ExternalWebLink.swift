//
//  ExternalWebLink.swift
//  AnimalKR
//
//  Created by Jacob Ko on 2022/12/24.
//

import SwiftUI

struct ExternalWebLink: View {
	
	let animal: Animal
	
    var body: some View {
		GroupBox {
			HStack {
				Image(systemName: "globe")
				Text("멸종 위기 야생생물 포털")
				
				Spacer()
				
				Group {
					Image(systemName: "arrow.up.right.square")
                    
                    // 💁 외부 링크를 연결 하는 방법 HTML a태그와 같음 
					Link(destination: (URL(string: animal.link)!)) {
						Text(animal.name)
					} // 링크를 넣어주면 외부로 이동 됨 
					.foregroundColor(.accentColor)
				}  //: GROUP
			} //: HSTACK
		} //: GROUPBOX
    }
}

struct ExternalWebLink_Previews: PreviewProvider {
    static var previews: some View {
		ExternalWebLink(animal: Animal.sampleAnimal)
    }
}
