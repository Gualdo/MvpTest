//
//  VCPresenter.swift
//  MvpTest
//
//  Created by De La Cruz, Eduardo on 25/10/2018.
//  Copyright © 2018 De La Cruz, Eduardo. All rights reserved.
//

import Foundation

protocol VCDelegate {
    func showMessage(message: String)
    func userSuccessfullyLoggedIn()
}

class VCPresenter: NSObject {
    var delegate: VCDelegate!
    var user: User!
    var name: String { return self.user.name }
    var gender: String { return self.user.gender }
    var email: String { return self.user.email }
    
    func validateData(userName: String, password: String) {
        if userName.count != 0 {
            if password.count != 0 {
                verify(userName: userName, password: password)
            } else {
                self.delegate.showMessage(message: "Password should not be empty")
            }
        } else {
            self.delegate.showMessage(message: "User Name should not be empty")
        }
    }
    
    fileprivate func verify(userName: String, password: String) {
        self.user = User(name: userName, email: "test@gmail.com", gender: "Male")
        if self.user.name == "test" && password == "123456" {
            //user is registered and we can log in
            self.delegate.userSuccessfullyLoggedIn()
        } else {
            self.delegate.showMessage(message: "Please enter valid username and password")
        }
    }
}
