//
//  IOSDeviceModel.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/11/17.
//

import Foundation


struct IOSDeviceModel: Identifiable {
	let id: String = UUID().uuidString
	let name: String
}
