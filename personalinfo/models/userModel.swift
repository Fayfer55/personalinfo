//
//  userModel.swift
//  personalinfo
//
//  Created by Кирилл Файфер on 28.08.2020.
//  Copyright © 2020 Кирилл Файфер. All rights reserved.
//

struct UserInfo {
    var userName: String
    var password: String
}

extension UserInfo {
    static func getUserName() -> String {
        "admin"
    }
    
    static func getPassword() -> String {
        "admin"
    }
}
