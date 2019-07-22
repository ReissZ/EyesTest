//
//  GetUsersResponse.swift
//  EyesTest
//
//  Created by Reiss Zurbyk on 2019-07-20.
//  Copyright © 2019 Reiss Zurbyk. All rights reserved.
//

import Foundation

struct GetUsersResponse {
    
    let users: [User]
    
    init(json: JSON) throws {
        //print(json)
        guard let data = json["users"] as? [JSON] else { throw Errors.userError }
        let users = data.map { User(json: $0) }.flatMap { $0 }
        self.users = users
    }
}
