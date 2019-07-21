//
//  User.swift
//  EyesTest
//
//  Created by Reiss Zurbyk on 2019-07-21.
//  Copyright © 2019 Reiss Zurbyk. All rights reserved.
//

import Foundation

struct Users {
    
    private let users: String

    init?(json: JSON) {
        guard let users = json["users"] as? String
            else { return nil }
        self.users = users
    }
}

struct User {
    
    private let userID: String
    private let profileImageURL: String
    
    let name: String
    let userName: String
    let createdDate: String
    
    init?(json: JSON) {
        guard let userID = json["id"] as? String,
        let name = json["name"] as? String,
        let userName = json["userName"] as? String,
        let profileImageURL = json["profileImage"] as? String,
        let createdDate = json["createdDate"] as? String
            else { return nil }
        self.userID = userID
        self.name = name
        self.userName = userName
        self.profileImageURL = profileImageURL
        self.createdDate = createdDate
    }
}
