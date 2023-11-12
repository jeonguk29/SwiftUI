//
//  ContentView.swift
//  05.SwiftUILearnEssentialSkills
//
//  Created by 정정욱 on 11/12/23.
//

import SwiftUI

// 1. 서버에 데이터를 요청한다
// 2. 데이터를 받아온다(Json)
// 3. 데이터를 파싱한다
// 4. 파싱한 데이터로 화면을 그린다

struct Article : Decodable {
    let id: Int
    let title, content, createdAt, updatedAt : String
    let userID: Int
    
    /*
     CodingKeys 열거형은 String 타입의 rawValue를 가지는 케이스들의 집합입니다. 각 케이스는 JSON 데이터의 키와 매칭되는 프로퍼티를 나타냅니다. 이를 통해 JSON 데이터의 특정 키와 매칭되는 프로퍼티 이름이 다른 경우에도 원하는 프로퍼티에 데이터를 할당할 수 있습니다.
     */
    enum CodingKeys: String, CodingKey {
        case id, title, content, createdAt, updatedAt
        case userID = "UserId"
    }
}

let dummyData = """
{
  "id": 1,
  "title": "정당의 목적이나 활동이 민주적 기본질서에 위배될 때에는 정부는 헌법재판소에 그 해산을 제소할 수 있고, 정당은 헌법재판소의 심판에 의하여 해산된다.",
  "content": "모든 국민은 인간으로서의 존엄과 가치를 가지며, 행복을 추구할 권리를 가진다. 모든 국민은 종교의 자유를 가진다. 국가는 농·어민과 중소기업의 자조조직을 육성하여야 하며, 그 자율적 활동과 발전을 보장한다. 모든 국민은 양심의 자유를 가진다. 누구든지 체포 또는 구속을 당한 때에는 즉시 변호인의 조력을 받을 권리를 가진다.",
  "createdAt": "2019-02-24T16:17:47.000Z",
  "updatedAt": "2019-02-24T16:17:47.000Z",
  "UserId": 1
}

"""

struct ContentView: View {
    
    @State var data: [String] = ["woogie", "jini"]
    
    var body: some View {
        VStack {
            List{
                ForEach(data, id: \.self) { item in
                    Text(item)
                }
                
            }
            
            Button {
                requestData()
            } label: {
                Text("Reqeust")
            }
        }
    }
        
    private func requestData() {
        do {
            // 어떤 타입으로 디코드 할거야?, 해당 데이터   
            let decodedResponse = try JSONDecoder().decode(Article.self, from: dummyData.data(using: .utf8)!)
            data.append(decodedResponse.title)
        } catch {
            print(error)
        }
    }
}

#Preview {
    ContentView()
}
