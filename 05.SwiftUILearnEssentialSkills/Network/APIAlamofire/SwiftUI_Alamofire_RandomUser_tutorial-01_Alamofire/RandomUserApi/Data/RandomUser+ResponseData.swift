//
//  RandomUser+ResponseData.swift
//  RandomUserApi
//
//  Created by Jeff Jeong on 2021/03/10.
//

import Foundation

/*
 순서 어떻게 날아오는지 구조를 알아야함
 1. PostMan에서 url 날려서 구조먼저 파악하기
 2. https://app.quicktype.io/ 같은 사이트에서 구조를 잡고 사용하고 싶은 부분만 남겨두기 
 3. 모델 만들고
 4. API 호출 후 디코딩하기 
 */
struct RandomUser: Codable, Identifiable, CustomStringConvertible {
    var id = UUID() // 각각이 고유해야함
    var name : Name
    var photo : Photo
    
    // 이름 바꾸고 싶으면 CodingKeys 사용
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case photo = "picture"
    }
    
    // 프리뷰에서 확인하기 위한 더미데이터 만들기
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return RandomUser(name: Name.getDummy(), photo: Photo.getDummy())
    }
    
    var profileImgUrl : URL {
        get {
            URL(string: photo.medium)!
        }
    }
    
    var description: String {
        return name.description
    }
    
}

struct Name: Codable, CustomStringConvertible {
    var title : String
    var first : String
    var last : String
    
    var description: String {
        return "[\(title)] \(last), \(first)"
    }
    
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return Name(title: "유튜버", first: "정대리", last: "개발하는")
    }
}

struct Photo: Codable {
    var large : String
    var medium : String
    var thumbnail : String
    
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return Photo(large: "https://randomuser.me/api/portraits/women/93.jpg",
                     medium: "https://randomuser.me/api/portraits/women/93.jpg",
                     thumbnail: "https://randomuser.me/api/portraits/women/93.jpg")
    }
}

struct Info : Codable {
    var seed : String
    var resultsCount : Int
    var page : Int
    var version : String
    private enum CodingKeys: String, CodingKey {
        case seed = "seed"
        case resultsCount = "results"
        case page = "page"
        case version = "version"
    }
}

struct RandomUserResponse: Codable, CustomStringConvertible {
    var results: [RandomUser]
    var info: Info
    private enum CodingKeys: String, CodingKey {
        case results, info
    }
    
    // CustomStringConvertible 사용하면 아래 같은 description 만들 수 있음 
    var description: String {
        return "results.count: \(results.count) / info : \(info.seed)"
    }
}

/*
 CustomStringConvertible는 Swift 표준 라이브러리의 프로토콜로, 객체에 대해 사용자 정의 문자열 표현을 제공할 수 있도록 합니다. 이 프로토콜을 채택하면, description이라는 속성을 구현해야 하며, 이 속성은 객체의 문자열 표현을 반환합니다. 이를 통해 디버깅이나 로그 출력 시 객체를 더 쉽게 이해할 수 있습니다.

 */
