//
//  User.swift
//  EyesTest
//
//  Created by Reiss Zurbyk on 2019-07-21.
//  Copyright © 2019 Reiss Zurbyk. All rights reserved.
//

import Foundation

struct Root: Decodable {
    let users: [User]
    
}

struct User: Decodable {
    
    let id: Int
    let name: String
    let userName: String
    let profileImage: URL
    let createdDate: Date
    
}
