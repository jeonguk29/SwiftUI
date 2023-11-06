//
//  GridRowBasic.swift
//  SwiftUIiOS16Basic
//
//  Created by Jacob Ko on 2022/12/09.
//

import SwiftUI

struct GridRowBasic: View {
    var body: some View {
		VStack (spacing: 20) {
			Grid {
                // 직관적으로 Row를 표시할 수 있게 되었음
				GridRow {
					Color.red
					Color.red
					Color.red
				} //: GRIDROW
				GridRow {
					Color.red
						.frame(width: 100, height: 100)
					Color.red
						.frame(width: 30, height: 30)
						.gridCellColumns(1)// 셀 범위 변경 가능 HTML table처럼 가로 행을 몇개 차지할건지 정하는 것
						.gridCellAnchor(.center)
				} //:GRIDROW
			} //: GRID
			.frame(height: 200)
			
			Divider()
			
			Grid {
				GridRow {
					Color.blue
						.frame(width: 30, height: 30)
					Color.blue
						.frame(width: 30, height: 30)
					Color.blue
						.frame(width: 30, height: 30)
				} //: GRIDROW
				
				GridRow {
					Color.blue
						.frame(width: 30, height: 30)
				} //:GRIDROW
			} //: GRID
			.frame(height: 200)
			
		} //:VSTACK
		.padding()
    }
}

struct GridRowBasic_Previews: PreviewProvider {
    static var previews: some View {
        GridRowBasic()
    }
}
