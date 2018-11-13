//
//  User.swift
//  MvpTest
//
//  Created by De La Cruz, Eduardo on 25/10/2018.
//  Copyright © 2018 De La Cruz, Eduardo. All rights reserved.
//

import Foundation

struct User {
    var name: String
    var email: String
    var gender: String
    
    init(name: String, email: String, gender: String) {
        self.name = name
        self.email = email
        self.gender = gender
    }
}
