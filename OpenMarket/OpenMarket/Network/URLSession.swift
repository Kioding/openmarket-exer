//
//  URLSession.swift
//  OpenMarket
//
//  Created by kio on 2021/05/28.
//

import Foundation

func sendRequest() {
    let baseUrl = "https://camp-open-market-2.herokuapp.com/items/:1"
    
    // 어떤 작업이든 URL 인스턴스 생성부터 시작
    let url = URL(string: baseUrl)! // 임시
    
    // shared session은 기본설정을 사용하여 네트워크 요청을 처리
    let session = URLSession.shared
    let task = session.dataTask(with: url) { (data, response, error) in
        // data - 서버에서 전달된 binary data
        // response - 서버응답에 대한 정보
        // error - 오류가 발생하지 않았다면 nil 전달
        
        if let error = error {
            print(error)
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            fatalError("Invalid Response")
            return
        }
        
        // 200~299는 성공코드
        guard (200...299).contains(httpResponse.statusCode) else {
            fatalError("httpResponse fail")
        }
        
        guard let data = data else {
            fatalError("Invaild Data")
        }
        
    }
    task.resume()
}
