//
//  NetworkingService.swift
//  EyesTest
//
//  Created by Reiss Zurbyk on 2019-07-20.
//  Copyright © 2019 Reiss Zurbyk. All rights reserved.
//

import Foundation

class NetworkingService {
    
    static let shared = NetworkingService()
    private init() {}
    
    let session = URLSession.shared
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter
    }()
    
    func getUsers(success successBlock: @escaping (Root) -> Void) {
        guard let url = URL(string: "https://eyes-technical-test.herokuapp.com/users") else { return }
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { [weak self] data, _, error in
            guard let `self` = self else { return }
            
            if let error = error { print(error); return }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(self.dateFormatter)
                let result = try decoder.decode(Root.self, from: data!)
                successBlock(result)
            } catch {
                print(error)
            }
            }.resume()
    }
}
