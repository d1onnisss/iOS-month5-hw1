//
//  LoginScreenModel.swift
//  iOS-month5-hw1
//
//  Created by Alexey Lim on 12/6/24.
//

import Foundation

struct User {
    var username: String
    var password: String
}

protocol LoginModelProtocol {
    func validate(username: String, password: String) -> Bool
}

class LoginScreenModel: LoginModelProtocol {
    private let user = User(username: "Alexey", password: "12345678")
    
    func validate(username: String, password: String) -> Bool {
        return username == user.username && password == user.password
    }
}
