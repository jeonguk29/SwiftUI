//
//  AiAPI.swift
//  SwiftAPIDemo
//
//  Created by 정정욱 on 12/4/23.
//

import Foundation
import SwiftUI

import Foundation

class AiAPI: ObservableObject {
    static let shared = AiAPI()
    private init() { }
    
    func createImageFromPrompt(prompt: String, completion: @escaping (Result<String, Error>) -> Void) {
        let API_KEY = "sc-9c9d055a55e26ae64a071b3c8ed572eb11224790c5a4da5374de66861be85d9f"
        let API_HOST = "https://api.stablecog.com"
        let API_ENDPOINT = "/v1/image/generation/create"
        let API_URL = "\(API_HOST)\(API_ENDPOINT)"
        
        var headers: [String: String] = [:]
        headers["Authorization"] = "Bearer \(API_KEY)"
        headers["Content-Type"] = "application/json"
        
        let requestBody: [String: Any] = [
            "prompt": prompt
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody, options: []) else {
            let error = NSError(domain: "JSONSerialization", code: 0, userInfo: nil)
            completion(.failure(error))
            return
        }
        
        let url = URL(string: API_URL)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted),
                       let jsonString = String(data: jsonData, encoding: .utf8) {
                        completion(.success(jsonString))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}
