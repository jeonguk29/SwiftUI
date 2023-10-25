//
//  UserModel.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/11/04.
//

import Foundation

// Identifiable 채택시 고유의 ID를 만들어줘야함 
struct UserModel: Identifiable {
	let id: String = UUID().uuidString // UUID() 고유의 ID값 생성후 문자열로 변환
	let displayName: String
	let userName: String
	let followerCount: Int
	let isChecked: Bool
}

