//
//  User.swift
//  Login
//
//  Created by Dmitry on 06.03.2020.
//  Copyright © 2020 Dmitry. All rights reserved.
//

struct User: Equatable {
    let userName: String
    let password: String
}

extension User {
    static func getUsers() -> [User] {
        return [
            User(userName: "User1", password: "Password1!"),
            User(userName: "User2", password: "qwerty"),
            User(userName: "User3", password: "123456"),
            User(userName: "User4", password: "qazwsx"),
        ]
    }
    
    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.userName == rhs.userName && lhs.password == rhs.password
    }
}
