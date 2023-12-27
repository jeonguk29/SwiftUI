//
//  CreditView.swift
//  AnimalKR
//
//  Created by Jacob Ko on 2022/12/24.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
		VStack {
			Text("""
  Copyright © Woogie
  All right reserved
  Created by SwiftUI with MVVM architecture
""")
			.font(.footnote)
			.multilineTextAlignment(.center) // 모든 라인 가운데 정렬 
			.padding()
			.opacity(0.5) // 약간 흐리게 
		}  //: VSTACK
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
