//
//  NetworkingService.swift
//  EyesTest
//
//  Created by Reiss Zurbyk on 2019-07-20.
//  Copyright © 2019 Reiss Zurbyk. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]

class NetworkingService {
    
    static let shared = NetworkingService()
    private init() {}
    
    let session = URLSession.shared
    
    func getUsers(success successBlock: @escaping (GetUsersResponse) -> Void) {
        guard let url = URL(string: "https://eyes-technical-test.herokuapp.com/users") else { return }
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { (data, _, _) in
            guard let data = data else { return }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON else {
                    return
                }
                let getUsersResponse = try GetUsersResponse(json: json)
                successBlock(getUsersResponse)
            } catch {}
        }.resume()
    }
}
