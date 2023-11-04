//
//  TextSelctionBasic.swift
//  SwiftUIiOS15Basic
//
//  Created by Jacob Ko on 2022/11/25.
//

import SwiftUI

struct TextSelctionBasic: View {
    var body: some View {
        Text("길게 누르면 복사 및 공유가 됩니다")
			.font(.title2)
			.textSelection(.enabled)
    }
}

struct TextSelctionBasic_Previews: PreviewProvider {
    static var previews: some View {
        TextSelctionBasic()
    }
}
