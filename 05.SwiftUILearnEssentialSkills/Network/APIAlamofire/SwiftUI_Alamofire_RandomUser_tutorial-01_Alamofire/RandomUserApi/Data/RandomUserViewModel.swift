//
//  RandomUserViewModel.swift
//  RandomUserApi
//
//  Created by Jeff Jeong on 2021/03/10.
//

import Foundation
import Combine
import Alamofire

class RandomUserViewModel: ObservableObject {
    
    //MARK: Properties
    var subscription = Set<AnyCancellable>() // 구독해제를 위해 생성
    
    @Published var randomUsers = [RandomUser]()
    
    var baseUrl = "https://randomuser.me/api/?results=100"
    
    init() {
        print(#fileID, #function, #line, "")
        fetchRandomUsers() // 뷰모델 생성될때 호출
    }
    
    func fetchRandomUsers(){
        print(#fileID, #function, #line, "")
        AF.request(baseUrl)
            .publishDecodable(type: RandomUserResponse.self) // 컴바인 사용하여 바로 디코딩 하기 
            .compactMap{ $0.value } // ⭐️ 컴바인에서 옵셔널 제거하는 방법 : 옵셔널이면 값이 있는거만 가져옴
            .map{ $0.results } // 해줘서 [RandomUser]로 들어옴
            .sink(receiveCompletion: { completion in
                print("데이터스트림 완료 ")
            }, receiveValue: { receivedValue in
                print("받은 값 : \(receivedValue.count)")
                self.randomUsers = receivedValue
            }).store(in: &subscription) // 구독이 다 되었으면 store 통해 메모리에서 다 날려주기
    }
    
}
