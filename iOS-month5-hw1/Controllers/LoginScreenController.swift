//
//  LoginScreenController.swift
//  iOS-month5-hw1
//
//  Created by Alexey Lim on 12/6/24.
//

import Foundation

protocol LoginControllerProtocol {
    func login(username: String, password: String)
}

class LoginScreenController: LoginControllerProtocol {
    var model: LoginModelProtocol
    var view: LoginScreenDelegate
    
    init(model: LoginModelProtocol, view: LoginScreenDelegate) {
        self.model = model
        self.view = view
    }
    
    func login(username: String, password: String) {
        if model.validate(username: username, password: password) {
            view.didLoginSuccess()
        } else {
            view.didLoginFail()
        }
    }
}
