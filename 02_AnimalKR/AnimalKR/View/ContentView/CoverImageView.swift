//
//  CoverImageView.swift
//  AnimalKR
//
//  Created by Jacob Ko on 2022/12/24.
//

import SwiftUI

struct CoverImageView: View {
	
	// property
	@ObservedObject var vm: AnimalViewModel
	
	var body: some View {
		TabView {
			ForEach(vm.coverImages) { cover in
				Image(cover.name)
					.resizable()
					.scaledToFill()
			} //: LOOP
		}  //: TAB
		.tabViewStyle(.page)
	} //: TAB
}


struct CoverImageView_Previews: PreviewProvider {
	static var previews: some View {
		CoverImageView(vm: AnimalViewModel())
			.previewLayout(.fixed(width: 400, height: 300))
        // 프리뷰 사이즈를 정하는 코드(내가 상위뷰에서 어느정도 보이면 좋겠다 확인 할때 사용하면 유용함)
	}
}
